//
//  CampaignViewCell.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "CampaignViewCell.h"

#import "MediaCollectionViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CampaignViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *rewardLabel;

@property (nonatomic, strong) MediaCollectionViewController *mediaVC;

@end

@implementation CampaignViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    UIView *headerContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NORMALIZED_HEIGHT(102))];
    [headerContainer setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:headerContainer];

    UIView *topDelimiter = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1.0)];
    [topDelimiter setBackgroundColor:[UIColor borderColor]];
    [headerContainer addSubview:topDelimiter];

    UIView *bottomDelimiter = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerContainer.frame) - 1.0, SCREEN_WIDTH, 1.0)];
    [bottomDelimiter setBackgroundColor:[UIColor borderColor]];
    [headerContainer addSubview:bottomDelimiter];

    UIView *iconContainer = [[UIView alloc] initWithFrame:RECT_MAKE(18, 18, 65, 65)];
    iconContainer.layer.cornerRadius = NORMALIZED_HEIGHT(18.0);
    iconContainer.layer.masksToBounds = YES;
    [headerContainer addSubview:iconContainer];

    _iconView = [[UIImageView alloc] initWithFrame:RECT_MAKE(0, 0, 65, 65)];
    [iconContainer addSubview:_iconView];

    _titleLabel = [[UILabel alloc] initWithFrame:RECT_MAKE(97, 21, 252, 28)];
    [_titleLabel setFont:[UIFont systemFontOfSize:NORMALIZED_HEIGHT(19) weight:UIFontWeightBold]];
    [headerContainer addSubview:_titleLabel];

    _rewardLabel = [[UILabel alloc] initWithFrame:RECT_MAKE(97, 50, 252, 28)];
    [_rewardLabel setFont:[UIFont systemFontOfSize:NORMALIZED_HEIGHT(16) weight:UIFontWeightRegular]];
    [_rewardLabel setTextColor:[UIColor greenColor]];
    [headerContainer addSubview:_rewardLabel];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0.0;
    layout.minimumLineSpacing = 0.0;
    _mediaVC = [[MediaCollectionViewController alloc] initWithCollectionViewLayout:layout];
    _mediaVC.view.frame = RECT_MAKE(0, 102, 375, 264);
    [self addSubview:_mediaVC.view];

    return self;
}

- (void)setCampaign:(Campaign*)campaign {
    [_titleLabel setText:campaign.campaignName];
    [_rewardLabel setText:[NSString stringWithFormat:@"%.1f per install", [campaign.payPerInstall floatValue]]];
    [_iconView sd_setImageWithURL:[NSURL URLWithString:campaign.campaignIconUrl]
                 placeholderImage:nil];
    [_mediaVC setMedia:campaign.medias];
}

- (void)prepareForReuse {
    [_titleLabel setText:@""];
    [_rewardLabel setText:@""];
    [_iconView sd_setImageWithURL:nil
                 placeholderImage:nil];
    [_mediaVC setMedia:[[NSMutableArray alloc] init]];
}

@end
