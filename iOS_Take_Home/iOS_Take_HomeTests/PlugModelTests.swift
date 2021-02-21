//
//  PlugModelTests.swift
//  iOS_Take_HomeTests
//
//  Created by Chad Rutherford on 10/1/20.
//

import XCTest
@testable import iOS_Take_Home

class PlugModelTests: XCTestCase {
	
	func test_model_withSampleJSONAtIndex1_shouldNotFail() throws {
		let decoder = JSONDecoder()
		let results = try decoder.decode(Feed.self, from: sampleJSON())
		let firstCampaign = results.campaigns.first!
		let firstMedia = firstCampaign.medias.first!
		XCTAssertEqual(results.campaigns.count, 8)
		XCTAssertEqual(firstCampaign.id, 1)
		XCTAssertEqual(firstCampaign.name, "Tiktok")
		XCTAssertEqual(firstCampaign.iconURL, URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/11/d7/70/11d770fa-14d6-e6ee-b118-c273bcf91906/"
														 + "AppIcon_TikTok-1x_U007emarketing-85-220-0-5.png/230x0w.jpg")!)
		XCTAssertEqual(firstCampaign.payPerInstall, "19.8")
		XCTAssertEqual(firstCampaign.medias.count, 4)
		XCTAssertEqual(firstMedia.coverPhotoURL, URL(string: "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/"
													 + "tiktok%2F44f871ab-a7de-4bcc-9ecf-4ecadbc5bc83.png?alt=media&token=ea854bfa-5fb7-4b23-b85c-312ae9860338"))
		XCTAssertEqual(firstMedia.downloadURL, URL(string: "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/"
												   + "tiktok%2F44f871ab-a7de-4bcc-9ecf-4ecadbc5bc83.mp4?alt=media&token=9580e0d2-f07e-4c78-bcab-d1b26d2c525a"))
		XCTAssertEqual(firstMedia.trackingLink, URL(string: "www.plugco.in/tiktok/2"))
		XCTAssertEqual(firstMedia.mediaType, "video")
	}
}
