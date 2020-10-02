//
//  MediaCollectionPlayerDelegate.swift
//  iOS_Take_Home
//
//  Created by Chad Rutherford on 10/2/20.
//

import UIKit

protocol MediaCollectionPlayerDelegate: AnyObject {
	func present(with media: Media)
}
