//
//  NativeAdCell.h
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface NativeAdCell : UITableViewCell

@property (weak, nonatomic) IBOutlet GADNativeExpressAdView *nativeBanner;
@property (weak, nonatomic) IBOutlet GADNativeExpressAdView *ExpressNativeBanner;

@end
