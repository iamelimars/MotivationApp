//
//  ViewController2.h
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;

@interface ViewController2 : UIViewController
{
    
    dispatch_queue_t bannerConcurrentQueue;
    
    
}
@property (weak, nonatomic) IBOutlet UIVisualEffectView *visualExxectView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UILabel *referenceLabel;
@property (weak, nonatomic) IBOutlet UITextView *verseTextView;

@end
