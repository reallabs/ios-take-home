//
//  MediaViewCell.m
//  iOS Takehome
//
//  Created by Timothy Lenardo on 6/24/19.
//  Copyright © 2019 Real Labs Technology, Inc. All rights reserved.
//

#import "MediaViewCell.h"

@import Photos;

#import "JDStatusBarNotification.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MediaViewCell ()

@property (nonatomic, strong) Media *media;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *playButton;
@property (nonatomic, strong) UIButton *linkButton;
@property (nonatomic, strong) UIButton *downloadButton;

@end

@implementation MediaViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    UIView *imageContainer = [[UIView alloc] initWithFrame:RECT_MAKE(0, 0, 101, 179)];
    imageContainer.layer.cornerRadius = NORMALIZED_HEIGHT(6.0);
    imageContainer.layer.masksToBounds = YES;
    [self addSubview:imageContainer];

    _imageView = [[UIImageView alloc] initWithFrame:RECT_MAKE(0, 0, 101, 179)];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.cornerRadius = NORMALIZED_HEIGHT(6.0);
    [imageContainer addSubview:_imageView];

    UIView *imageShade = [[UIView alloc] initWithFrame:RECT_MAKE(0, 0, 101, 179)];
    [imageShade setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    [imageContainer addSubview:imageShade];

    _playButton = [[UIImageView alloc] initWithFrame:RECT_MAKE(42, 77, 23, 25)];
    [_playButton setImage:[UIImage imageNamed:@"play"]];
    [imageContainer addSubview:_playButton];

    UIView *backgroundView = [[UIView alloc] initWithFrame:RECT_MAKE(0, 185, 101, 46)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.cornerRadius = NORMALIZED_HEIGHT(6.0);
    backgroundView.layer.borderWidth = 1.0;
    backgroundView.layer.borderColor = [UIColor borderColor].CGColor;
    [self addSubview:backgroundView];

    UIView *verticalDelimiter = [[ UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(backgroundView.frame), 0, 1.0, backgroundView.frame.size.height)];
    [verticalDelimiter setBackgroundColor:[UIColor borderColor]];
    [backgroundView addSubview:verticalDelimiter];

    _linkButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetMidX(backgroundView.frame), backgroundView.frame.size.height)];
    [_linkButton addTarget:self action:@selector(onCopyTapped) forControlEvents:UIControlEventTouchUpInside];
    [_linkButton setImage:[UIImage imageNamed:@"link"] forState:UIControlStateNormal];
    [backgroundView addSubview:_linkButton];

    _downloadButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(backgroundView.frame), 0, CGRectGetMidX(backgroundView.frame), backgroundView.frame.size.height)];
    [_downloadButton addTarget:self action:@selector(onDownloadTapped) forControlEvents:UIControlEventTouchUpInside];
    [_downloadButton setImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
    [backgroundView addSubview:_downloadButton];

    return self;
}

- (void)setMedia:(Media*)media {
    _media = media;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:media.coverPhotoUrl]
                  placeholderImage:nil];
    [_playButton setAlpha:([media.mediaType isEqualToString:@"video"] ? 1.0 : 0.0)];
}

- (void)prepareForReuse {
    _media = nil;
    [_imageView sd_setImageWithURL:nil
                  placeholderImage:nil];
    [_playButton setAlpha:0.0];
}

- (void)onCopyTapped {
    if (_media) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = _media.trackingLink;
            NSString *alertString = [NSString stringWithFormat:NSLocalizedString(@"Copied caption!", nil)];
            [JDStatusBarNotification showWithStatus:alertString dismissAfter:3.0 styleName:@"JDStatusBarSuccessColor"];
        });

    }
}

- (void)onDownloadTapped {
    if (_media) {
        BOOL failed = YES;
        NSURL *url = [NSURL URLWithString:_media.downloadUrl];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        if (urlData) {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *filePath = [NSString stringWithFormat:@"%@/%@.mp4", documentsDirectory, [[NSUUID UUID] UUIDString]];
            BOOL written = [urlData writeToFile:filePath atomically:YES];
            if (written) {
                // Save to camer roll

                if ([_media.mediaType isEqualToString:@"photo"]) {
                    failed = NO;
                    UIImageWriteToSavedPhotosAlbum(_imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
                } else if ([_media.mediaType isEqualToString:@"video"]) {
                    failed = NO;
                    __block PHObjectPlaceholder *placeholder;
                    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        PHAssetChangeRequest* createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:[NSURL URLWithString:filePath]];
                        createAssetRequest.creationDate = [NSDate date];
                        placeholder = [createAssetRequest placeholderForCreatedAsset];
                    } completionHandler:^(BOOL success, NSError *error) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            if (success) {
                                NSString *alertString = [NSString stringWithFormat:NSLocalizedString(@"Downloaded!", nil)];
                                [JDStatusBarNotification showWithStatus:alertString dismissAfter:3.0 styleName:@"JDStatusBarSuccessColor"];
                            } else {
                                NSLog(@"Error %@", error.localizedDescription);
                                NSString *alertString = [NSString stringWithFormat:NSLocalizedString(@"Download failed, try again!", nil)];
                                [JDStatusBarNotification showWithStatus:alertString dismissAfter:3.0 styleName:@"JDStatusBarFailedColor"];
                            }
                        });
                    }];
                }
            }
        }

        if (failed) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *alertString = [NSString stringWithFormat:NSLocalizedString(@"Download failed, try again!", nil)];
                [JDStatusBarNotification showWithStatus:alertString dismissAfter:3.0 styleName:@"JDStatusBarFailedColor"];
            });
        }
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!error) {
            [JDStatusBarNotification showWithStatus:NSLocalizedString(@"Downloaded!", nil) dismissAfter:2.0 styleName:@"JDStatusBarSuccessColor"];
        } else {
            NSString *alertString = [NSString stringWithFormat:NSLocalizedString(@"Download failed, try again!", nil)];
            [JDStatusBarNotification showWithStatus:alertString dismissAfter:3.0 styleName:@"JDStatusBarFailedColor"];
        }
    });

}


@end
