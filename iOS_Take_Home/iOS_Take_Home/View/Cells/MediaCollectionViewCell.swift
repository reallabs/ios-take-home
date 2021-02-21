//
//  MediaCollectionViewCell.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import PhotosUI
import UIKit

class MediaCollectionViewCell: UICollectionViewCell {
	
	let previewImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.layer.cornerRadius = 15
		imageView.layer.cornerCurve = .continuous
		imageView.clipsToBounds = true
		return imageView
	}()
	
	let blurView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 15
		view.layer.cornerCurve = .continuous
		view.clipsToBounds = true
		view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
		return view
	}()
	
	let playButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.isUserInteractionEnabled = true
		button.setImage(UIImage.play.applyingSymbolConfiguration(UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 30))), for: .normal)
		button.backgroundColor = .clear
		button.tintColor = .white
		button.layer.cornerRadius = 4
		button.clipsToBounds = true
		return button
	}()
	
	let linkButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.isUserInteractionEnabled = true
		button.setImage(.link, for: .normal)
		button.backgroundColor = .systemBackground
		button.tintColor = .systemGray
		button.layer.cornerRadius = 4
		button.layer.borderColor = UIColor.systemGray.cgColor
		button.layer.borderWidth = 0.5
		button.layer.masksToBounds = true
		return button
	}()
	
	let downloadButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(.download, for: .normal)
		button.backgroundColor = .systemBackground
		button.tintColor = .systemGray
		button.layer.cornerRadius = 4
		button.layer.borderColor = UIColor.systemGray.cgColor
		button.layer.borderWidth = 0.5
		button.layer.masksToBounds = true
		return button
	}()
	
	weak var delegate: MediaCollectionPlayerDelegate!
	var campaignController: CampaignController?
	var media: Media? {
		didSet {
			updateViews()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		previewImageView.image = nil
	}
	
	private func configureUI() {
		contentView.addSubview(previewImageView)
		contentView.addSubview(linkButton)
		contentView.addSubview(downloadButton)
		NSLayoutConstraint.activate([
			previewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			previewImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			previewImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			
			linkButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 8),
			linkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
			linkButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
			linkButton.heightAnchor.constraint(equalToConstant: 40),
			linkButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
			
			downloadButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 8),
			downloadButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
			downloadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
			downloadButton.heightAnchor.constraint(equalToConstant: 40),
			downloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
		])
		downloadButton.addTarget(self, action: #selector(downloadMedia), for: .touchUpInside)
		linkButton.addTarget(self, action: #selector(copyLink), for: .touchUpInside)
	}
	
	private func addPlayButton() {
		previewImageView.addSubview(blurView)
		blurView.addSubview(playButton)
		NSLayoutConstraint.activate([
			blurView.leadingAnchor.constraint(equalTo: previewImageView.leadingAnchor),
			blurView.topAnchor.constraint(equalTo: previewImageView.topAnchor),
			blurView.trailingAnchor.constraint(equalTo: previewImageView.trailingAnchor),
			blurView.bottomAnchor.constraint(equalTo: previewImageView.bottomAnchor),
			
			playButton.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
			playButton.centerYAnchor.constraint(equalTo: blurView.centerYAnchor)
		])
		playButton.addTarget(self, action: #selector(playVideoInVideoPlayer), for: .touchUpInside)
	}
	
	private func updateViews() {
		guard let media = media,
			  let campaignController = campaignController
		else { return }
		campaignController.fetchImage(for: media.coverPhotoURL) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let image):
				self.previewImageView.image = image
			case .failure(let error):
				print(error)
			}
		}
		if media.mediaType == "video" {
			addPlayButton()
		}
	}
	
	@objc private func downloadMedia() {
		guard let media = media else { return }
		DispatchQueue.global(qos: .background).async {
			if let urlData = try? Data(contentsOf: media.downloadURL) {
				let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
				let filePath = URL(fileURLWithPath: "\(documentsPath)/tempFile.mp4")
				DispatchQueue.main.async {
					do {
						try urlData.write(to: filePath)
					} catch {
						print(error)
					}
					PHPhotoLibrary.shared().performChanges {
						PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: filePath)
					} completionHandler: { completed, error in
						if completed {
							print("Video saved!")
						}
					}
				}
			}
		}
	}
	
	@objc private func copyLink() {
		guard let media = media else { return }
		let pasteboard = UIPasteboard.general
		pasteboard.string = media.trackingLink.absoluteString
	}
	
	@objc private func playVideoInVideoPlayer() {
		guard let media = media else { return }
		delegate.present(with: media)
	}
}

extension MediaCollectionViewCell: ReuseIdentifiable {
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
}
