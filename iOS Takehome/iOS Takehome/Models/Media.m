//
//  Media.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "Media.h"

@implementation Media

+ (JSONKeyMapper *)keyMapper {
    JSONKeyMapper *snakeCaseMapper = [JSONKeyMapper mapperForSnakeCase];
    NSDictionary *mapping = @{};
    return [JSONKeyMapper baseMapper:snakeCaseMapper withModelToJSONExceptions:mapping];
}

@end
