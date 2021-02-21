//
//  FeedCollectionViewCell.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
	
	let iconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 15
		imageView.layer.cornerCurve = .continuous
		imageView.clipsToBounds = true
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		return label
	}()
	
	let payLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
		label.textColor = .payPerInstallColor
		return label
	}()
	
	let payPerInstallLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "per install"
		label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
		label.textColor = .payPerInstallColor
		return label
	}()
	
	lazy var mediaCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.backgroundColor = .secondarySystemBackground
		return cv
	}()
	
	var delegate: MediaCollectionPlayerDelegate?
	var campaignController: CampaignController?
	var campaign: Campaign? {
		didSet {
			updateViews()
			mediaCollectionView.reloadData()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
		configureCollectionView()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		iconImageView.image = nil
	}
	
	private func configureCollectionView() {
		mediaCollectionView.dataSource = self
		mediaCollectionView.delegate = self
		mediaCollectionView.register(MediaCollectionViewCell.self, forCellWithReuseIdentifier: MediaCollectionViewCell.reuseIdentifier)
		mediaCollectionView.showsVerticalScrollIndicator = false
		mediaCollectionView.showsHorizontalScrollIndicator = false
	}
	
	private func configureUI() {
		contentView.addSubview(iconImageView)
		contentView.addSubview(nameLabel)
		contentView.addSubview(payLabel)
		contentView.addSubview(payPerInstallLabel)
		contentView.addSubview(mediaCollectionView)
		NSLayoutConstraint.activate([
			
			iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			iconImageView.heightAnchor.constraint(equalToConstant: 60),
			iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 1),
			
			nameLabel.topAnchor.constraint(equalTo: iconImageView.topAnchor, constant: 8),
			nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
			nameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -20),
			nameLabel.heightAnchor.constraint(equalToConstant: 20),
			
			payLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			payLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			payLabel.heightAnchor.constraint(equalToConstant: 25),
			payLabel.trailingAnchor.constraint(equalTo: payPerInstallLabel.leadingAnchor, constant: -4),
			
			payPerInstallLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
			payPerInstallLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor),
			payPerInstallLabel.heightAnchor.constraint(equalToConstant: 25),
			
			mediaCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			mediaCollectionView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16),
			mediaCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			mediaCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
	
	private func updateViews() {
		guard let campaign = campaign,
			  let campaignController = campaignController
		else { return }
		campaignController.fetchImage(for: campaign.iconURL) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let image):
				self.iconImageView.image = image
			case .failure(let error):
				print(error)
			}
		}
		nameLabel.text = campaign.name
		payLabel.text = campaign.payPerInstall
	}
}

extension FeedCollectionViewCell: ReuseIdentifiable {
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
}

extension FeedCollectionViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		campaign?.medias.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = mediaCollectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.reuseIdentifier, for: indexPath) as? MediaCollectionViewCell,
			  let campaign = campaign,
			  let delegate = delegate else { fatalError("Unable to dequeue a MediaCollectionViewCell") }
		let media = campaign.medias[indexPath.item]
		cell.delegate = delegate
		cell.campaignController = campaignController
		cell.media = media
		return cell
	}
}

extension FeedCollectionViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: (mediaCollectionView.frame.width / 3) - 20, height: ((mediaCollectionView.frame.width / 3) - 5) * 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
	}
}
