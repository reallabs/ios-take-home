//
//  NetworkError.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/1/20.
//

import Foundation

enum NetworkError: Error {
	case unknownError
	case invalidResponse
	case invalidData
	case decodeError
	case noImage
	
	public var localizedDescription: String {
		switch self {
		case .unknownError:
			return "An unknown error occurred."
		case .invalidResponse:
			return "The response from the server was invalid. Please try again."
		case .invalidData:
			return "The data returned from the server was invalid."
		case .decodeError:
			return "There was an error decoding objects."
		case .noImage:
			return "There was an issue downloading your image."
		}
	}
}
