//
//  ViewController.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "ViewController.h"

#import "ApiFunctions.h"
#import "CampaignCollectionViewController.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray<Campaign*> *campaigns;
@property (nonatomic, strong) CampaignCollectionViewController *campaignVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIEdgeInsets insets = IS_IPHONE_X_DIMENSIONS ? UIEdgeInsetsMake(44.0, 0, 44.0, 0) : UIEdgeInsetsMake(0, 0, 0, 0);
    CGRect headerRect = CGRectMake(0, insets.top, SCREEN_WIDTH, IS_IPHONE_X_DIMENSIONS ? NORMALIZED_HEIGHT(kHeaderFooterHeight) : NORMALIZED_HEIGHT(kHeaderFooterHeight + 20));
    UIView *headerBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(headerRect))];
    [headerBackground setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:headerBackground];

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, insets.top, SCREEN_WIDTH, NORMALIZED_HEIGHT(kHeaderFooterHeight))];
    [titleLabel setFont:[UIFont systemFontOfSize:NORMALIZED_HEIGHT(14.0) weight:UIFontWeightSemibold]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:@"PLUGS"];
    [self.view addSubview:titleLabel];

    UIView *delimiter = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerRect) - 1, SCREEN_WIDTH, 1.0)];
    [delimiter setBackgroundColor:[UIColor borderColor]];
    [self.view addSubview:delimiter];

    UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _campaignVC = [[CampaignCollectionViewController alloc] initWithCollectionViewLayout:layout];
    _campaignVC.view.frame = CGRectMake(0, CGRectGetMaxY(headerRect), SCREEN_WIDTH, SCREEN_HEIGHT - CGRectGetMaxY(headerRect));
    [self.view addSubview:_campaignVC.view];

    _campaigns = [[NSMutableArray alloc] init];
    [self getCampaigns];
}

- (void)getCampaigns {
    __weak ViewController *weakSelf = self;
    [ApiFunctions getFeedWithCompletion:^(id responseObject, NSError *error) {
        if (!error) {
            weakSelf.campaigns = [[NSMutableArray alloc] init];
            for (id campaignObject in responseObject[@"campaigns"]) {
                NSError *jsonError;
                Campaign *curCampaign = [[Campaign alloc] initWithDictionary:campaignObject error:&jsonError];
                if (!jsonError) {
                    [weakSelf.campaigns addObject:curCampaign];
                } else {
                    NSLog(@"What to do..?");
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.campaignVC setCampaigns:weakSelf.campaigns];
            });
        } else {
            NSLog(@"Failed");
        }
    }];
}

@end
