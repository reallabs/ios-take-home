//
//  Campaign.h
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "Media.h"

@interface Campaign : JSONModel

@property (nonatomic) NSInteger cId;
@property NSString <Optional> *campaignName;
@property NSString <Optional> *campaignIconUrl;
@property NSNumber <Optional> *payPerInstall;

@property NSMutableArray<Media*><Optional,Media> *medias;

@end
