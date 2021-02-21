//
//  CampaignController.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import UIKit

class CampaignController {
	
	let expectedResponseCodes = Set(200 ... 299)
	
	func fetchFeed(_ completion: @escaping (Result<Feed, NetworkError>) -> Void) {
		guard let url = URL(string: API.baseURL)?.appendingPathComponent(API.publicEndpoint).appendingPathComponent(API.feed) else { return }
		var request = URLRequest(url: url)
		request.httpMethod = HTTPMethod.get.rawValue
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard error == nil else {
				DispatchQueue.main.async {
					completion(.failure(.unknownError))
				}
				return
			}
			
			if let response = response as? HTTPURLResponse, !self.expectedResponseCodes.contains(response.statusCode) {
				DispatchQueue.main.async {
					completion(.failure(.invalidResponse))
				}
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async {
					completion(.failure(.invalidData))
				}
				return
			}
			
			let decoder = JSONDecoder()
			do {
				let results = try decoder.decode(Feed.self, from: data)
				DispatchQueue.main.async {
					completion(.success(results))
				}
			} catch {
				DispatchQueue.main.async {
					completion(.failure(.decodeError))
				}
				return
			}
		}.resume()
	}
	
	func fetchImage(for url: URL, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
		var request = URLRequest(url: url)
		request.httpMethod = HTTPMethod.get.rawValue
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard error == nil else {
				DispatchQueue.main.async {
					completion(.failure(.unknownError))
				}
				return
			}
			
			if let response = response as? HTTPURLResponse, !self.expectedResponseCodes.contains(response.statusCode) {
				DispatchQueue.main.async {
					completion(.failure(.invalidResponse))
				}
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async {
					completion(.failure(.invalidData))
				}
				return
			}
			
			guard let image = UIImage(data: data) else {
				DispatchQueue.main.async {
					completion(.failure(.noImage))
				}
				return
			}
			
			DispatchQueue.main.async {
				completion(.success(image))
			}
		}.resume()
	}
}
