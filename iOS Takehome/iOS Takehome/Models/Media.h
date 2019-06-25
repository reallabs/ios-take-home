//
//  Media.h
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol Media;

@interface Media : JSONModel

@property NSString <Optional> *coverPhotoUrl;
@property NSString <Optional> *downloadUrl;
@property NSString <Optional> *trackingLink;
@property NSString <Optional> *mediaType;

@end
