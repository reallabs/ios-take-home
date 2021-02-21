//
//  FeedCollectionViewController.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import AVKit
import UIKit

class FeedCollectionViewController: UICollectionViewController {
	
	var campaignController: CampaignController
	var feed: Feed? {
		didSet {
			collectionView.reloadData()
		}
	}
	
	init(layout: UICollectionViewLayout, campaignController: CampaignController) {
		self.campaignController = campaignController
		super.init(collectionViewLayout: layout)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		configureCollectionView()
		campaignController.fetchFeed { result in
			switch result {
			case .success(let feed):
				self.feed = feed
			case .failure(let error):
				print(error)
			}
		}
	}
	
	private func configureCollectionView() {
		collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.reuseIdentifier)
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.isUserInteractionEnabled = true
	}
	
	private func configureUI() {
		title = "PLUGS"
		collectionView.backgroundColor = .systemBackground
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		feed?.campaigns.count ?? 0
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.reuseIdentifier, for: indexPath) as? FeedCollectionViewCell else { fatalError("Unable to dequeue a FeedCollectionViewCell") }
		cell.delegate = self
		cell.campaignController = campaignController
		cell.campaign = feed?.campaigns[indexPath.item]
		return cell
	}
}

extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: collectionView.frame.width, height: 360)
	}
}

extension FeedCollectionViewController: MediaCollectionPlayerDelegate {
	func present(with media: Media) {
		let videoURL = media.coverPhotoURL
		let player = AVPlayer(url: videoURL)
		let playerVC = AVPlayerViewController()
		playerVC.player = player
		present(playerVC, animated: true) {
			player.play()
		}
	}
}
