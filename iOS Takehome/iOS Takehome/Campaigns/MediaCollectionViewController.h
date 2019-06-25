//
//  MediaCollectionViewController.h
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "MediaCollectionViewController.h"

#import "Media.h"

@interface MediaCollectionViewController : UICollectionViewController

- (void)setMedia:(NSMutableArray<Media*>*)media;

@end
