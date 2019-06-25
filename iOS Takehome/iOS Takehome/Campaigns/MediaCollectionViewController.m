//
//  MediaCollectionViewController.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "MediaCollectionViewController.h"

#import "MediaViewCell.h"

#define kMediaViewCell @"kMediaViewCell"

@interface MediaCollectionViewController ()

@property (nonatomic, strong) NSMutableArray<Media*> *media;

@end

@implementation MediaCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[MediaViewCell class] forCellWithReuseIdentifier:kMediaViewCell];
    [self.collectionView setBackgroundColor:[UIColor backgroundColor]];
    self.collectionView.bounces = YES;
    self.collectionView.clipsToBounds = YES;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView setContentInset:UIEdgeInsetsMake(NORMALIZED_HEIGHT(18), NORMALIZED_WIDTH(18), NORMALIZED_HEIGHT(15), NORMALIZED_WIDTH(6.0))]; // One pixel hides top delimiter except on ptr
    _media = [[NSMutableArray alloc] init];
}

- (void)setMedia:(NSMutableArray<Media *> *)media {
    _media = media;
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_media count];
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(NORMALIZED_WIDTH(113), NORMALIZED_HEIGHT(230));
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MediaViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMediaViewCell forIndexPath:indexPath];
    [cell setMedia:_media[indexPath.row]];
    return cell;
}


@end
