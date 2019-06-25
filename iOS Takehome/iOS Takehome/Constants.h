//
//  Constants.h
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#define kHeaderFooterHeight 49

#define MIDDLE_START(XXX, YYY) (int)(XXX / 2.0 - YYY / 2.0)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IS_IPHONE_4_OR_LESS (SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)
#define IS_IPHONE_X_DIMENSIONS (SCREEN_HEIGHT / SCREEN_WIDTH > 2.0)

#define NORMALIZED_WIDTH(XXX) (int)(XXX / 375.0 * SCREEN_WIDTH)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#ifdef IS_IPHONE_X
#define NORMALIZED_HEIGHT(XXX) (int)(XXX)
#else
#define NORMALIZED_HEIGHT(XXX) (int)(XXX / 667.0 * SCREEN_HEIGHT)
#endif

#define RECT_MAKE(STARTX, STARTY, SIZEX, SIZEY) CGRectMake(NORMALIZED_WIDTH(STARTX), NORMALIZED_HEIGHT(STARTY), NORMALIZED_WIDTH(SIZEX), NORMALIZED_HEIGHT(SIZEY))

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

#define TICK(XXX) NSDate *XXX = [NSDate date]
#define TOCK(XXX) NSLog(@"%s: %f", #XXX, -[XXX timeIntervalSinceNow])

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
