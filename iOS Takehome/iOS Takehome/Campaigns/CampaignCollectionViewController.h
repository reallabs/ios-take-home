//
//  CampaignCollectionViewController.h
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "Campaign.h"

@interface CampaignCollectionViewController : UICollectionViewController

- (void)setCampaigns:(NSMutableArray<Campaign*>*)campaigns;

@end
