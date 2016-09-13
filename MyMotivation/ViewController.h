//
//  ViewController.h
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "NYSegmentedControl.h"
#import "DGActivityIndicatorView.h"
 


@interface ViewController : UIViewController <UIScrollViewDelegate> {
    
    dispatch_queue_t mConcurrentQueue;
    dispatch_queue_t StartConcurrentQueue;
    dispatch_queue_t bannerConcurrentQueue;
    NYSegmentedControl *segmentedControl;
    DGActivityIndicatorView *activityIndicatorView;
    
}

@property (strong, nonatomic) ViewController2 *view2;

@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *myPageControl;

@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

@end

