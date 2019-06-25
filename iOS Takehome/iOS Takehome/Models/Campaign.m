//
//  Campaign.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "Campaign.h"

@implementation Campaign

+ (JSONKeyMapper *)keyMapper {
    JSONKeyMapper *snakeCaseMapper = [JSONKeyMapper mapperForSnakeCase];
    NSDictionary *mapping = @{@"cId": @"id",
                              };
    return [JSONKeyMapper baseMapper:snakeCaseMapper withModelToJSONExceptions:mapping];
}

- (void)setPayPerInstallWithNSString:(NSString *)str {
    self.payPerInstall = [NSNumber numberWithFloat:[str floatValue]];
}


@end
