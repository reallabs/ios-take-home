//
//  ApiFunctions.h
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

@interface ApiFunctions : NSObject

+ (void)getFeedWithCompletion:(void (^)(id responseObject, NSError *error))completion;

+ (void)downloadFromAPIWithGet:(NSString *)api completion:(void (^)(id responseObject, NSError *error))completion;
    
@end
