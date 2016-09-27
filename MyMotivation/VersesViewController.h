//
//  VersesViewController.h
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMobileAds;
#import <MessageUI/MFMessageComposeViewController.h>
#import "MessageUI/MessageUI.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface VersesViewController : UIViewController <UIDocumentInteractionControllerDelegate,MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate> {
    
    dispatch_queue_t bannerConcurrentQueue;
    SLComposeViewController *SLComposer;
    SLComposeViewController *twitterSLComposer;

    
}

@property (nonatomic, strong) UIDocumentInteractionController *docController;

@property (weak, nonatomic) IBOutlet UILabel *referenceLabel;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
- (IBAction)imessageButton:(id)sender;
- (IBAction)facebookButton:(id)sender;
- (IBAction)twitterButton:(id)sender;


@property (weak, nonatomic) IBOutlet UITextView *verseTextView;
@property (weak, nonatomic) IBOutlet GADNativeExpressAdView *NativeExpressAd;
@property (strong) NSManagedObjectModel *device;
@end
