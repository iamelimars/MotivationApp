//
//  ViewController1.h
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGActivityIndicatorView.h"
#import <ChameleonFramework/Chameleon.h>



@interface ViewController1 : UIViewController <UIWebViewDelegate>
{
    DGActivityIndicatorView *activityIndicatorView;
    dispatch_queue_t StartConcurrentQueue;

    
}
@property (weak, nonatomic) IBOutlet UIWebView *bibleWebView;
- (IBAction)refreshButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
@property (weak, nonatomic) IBOutlet UIView *animationView;

@end
