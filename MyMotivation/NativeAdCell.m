//
//  NativeAdCell.m
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "NativeAdCell.h"

@implementation NativeAdCell
@synthesize nativeBanner = _nativeBanner;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //self.nativeBanner.adUnitID = @"ca-app-pub-9906091830733745/6715656918";
    //self.nativeBanner.rootViewController = self;
    //self.bannerView.frame = CGRectMake(0.0, 0.0, AdCell.contentView.frame.size.width, AdCell.frame.size.height);
    //GADRequest *request = [GADRequest request];
    //request.testDevices = @[
    //                        @"fd3efe9a2aa0d5b371f5a7e868f7d08a"  // Eli's Iphone
    //                        ];
    //[self.nativeBanner loadRequest:[GADRequest request]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
