//
//  CampaignCollectionViewController.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "CampaignCollectionViewController.h"
#import "CampaignViewCell.h"

#define kCampaignCellId @"kCampaignCellId"

@interface CampaignCollectionViewController ()

@property (nonatomic, strong) NSMutableArray<Campaign*> *campaigns;

@end

@implementation CampaignCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[CampaignViewCell class] forCellWithReuseIdentifier:kCampaignCellId];
    self.collectionView.backgroundColor = [UIColor backgroundColor];
    self.collectionView.bounces = YES;
    self.collectionView.clipsToBounds = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView setContentInset:UIEdgeInsetsMake(-1.0, 0.0, 0.0, 0.0)]; // One pixel hides top delimiter except on ptr

    _campaigns = [[NSMutableArray alloc] init];
}

- (void)setCampaigns:(NSMutableArray<Campaign*>*)campaigns {
    _campaigns = campaigns;
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_campaigns count];
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH, NORMALIZED_HEIGHT(367));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CampaignViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCampaignCellId forIndexPath:indexPath];
    [cell setCampaign:_campaigns[indexPath.row]];
    return cell;
}


@end
