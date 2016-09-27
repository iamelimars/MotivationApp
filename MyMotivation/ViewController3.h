//
//  ViewController3.h
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface ViewController3 : UIViewController
{
    
    dispatch_queue_t bannerConcurrentQueue;
    
}
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UIButton *savedVersesButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;


@end
