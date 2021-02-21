//
//  Feed.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import Foundation

struct Feed: Codable {
	let campaigns: [Campaign]
}

struct Campaign: Codable {
	let id: Int
	let name: String
	let iconURL: URL
	let payPerInstall: String
	let medias: [Media]
	
	enum CampaignKeys: String, CodingKey {
		case id
		case name = "campaign_name"
		case iconURL = "campaign_icon_url"
		case payPerInstall = "pay_per_install"
		case medias
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CampaignKeys.self)
		id = try container.decode(Int.self, forKey: .id)
		name = try container.decode(String.self, forKey: .name)
		iconURL = try container.decode(URL.self, forKey: .iconURL)
		payPerInstall = try container.decode(String.self, forKey: .payPerInstall)
		medias = try container.decode([Media].self, forKey: .medias)
	}
}

struct Media: Codable {
	let coverPhotoURL: URL
	let downloadURL: URL
	let trackingLink: URL
	let mediaType: String
	
	enum MediaKeys: String, CodingKey {
		case coverPhotoURL = "cover_photo_url"
		case downloadURL = "download_url"
		case trackingLink = "tracking_link"
		case mediaType = "media_type"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: MediaKeys.self)
		coverPhotoURL = try container.decode(URL.self, forKey: .coverPhotoURL)
		downloadURL = try container.decode(URL.self, forKey: .downloadURL)
		trackingLink = try container.decode(URL.self, forKey: .trackingLink)
		mediaType = try container.decode(String.self, forKey: .mediaType)
	}
}
