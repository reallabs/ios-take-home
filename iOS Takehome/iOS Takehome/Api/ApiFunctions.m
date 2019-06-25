//
//  ApiFunctions.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "ApiFunctions.h"

@implementation ApiFunctions

+ (void)getFeedWithCompletion:(void (^)(id responseObject, NSError *error))completion {
    [self downloadFromAPIWithGet:@"public/take_home_sample_feed" completion:^(id responseObject, NSError *error) {
        if (responseObject && !error) {
            completion(responseObject, nil);
        } else {
            NSLog(@"%s: serverRequest error: %@", __FUNCTION__, error);
            completion(responseObject, error);
        }
    }];
}

+ (void)downloadFromAPIWithGet:(NSString *)api completion:(void (^)(id responseObject, NSError *error))completion {
    NSURLSession *defaultSession = [NSURLSession sharedSession];
    NSString *stringurl = [@"https://www.plugco.in/" stringByAppendingString:api];

    NSURL *URL = [NSURL URLWithString:[stringurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    NSURLSessionDataTask *downloadTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if ([(NSHTTPURLResponse *)response statusCode] != 200) {
            if (completion) {
                NSLog(@"Did not return status 200. Error");
                NSError *error = [NSError errorWithDomain:@"httpError" code:[(NSHTTPURLResponse *)response statusCode] userInfo:nil];
                completion(response, error);
            }
            return;
        }
        if (!data) {
            NSError *error = [NSError errorWithDomain:@"noDataReturned" code:[(NSHTTPURLResponse *)response statusCode] userInfo:nil];
            if (completion) {
                completion(nil, error);
            }
        } else {
            NSError *parseError = nil;
            NSJSONSerialization *returnedData;
            returnedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parseError];
            if ([data length] > 0 && parseError) {
                if (completion) {
                    NSLog(@"Failed to parse data");
                    completion(response, parseError);
                }
                return;
            }
            if (completion) {
                completion(returnedData, error);
            }
        }
    }];

    [downloadTask resume];
}

@end
