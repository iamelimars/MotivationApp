//
//  TableViewController.h
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NativeAdCell.h"
@import GoogleMobileAds;

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet GADNativeExpressAdView *bannerView;


@end
