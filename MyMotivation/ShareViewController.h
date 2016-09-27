//
//  ShareViewController.h
//  MyMotivation
//
//  Created by iMac on 9/20/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>
#import "MessageUI/MessageUI.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "QuoteData.h"

@interface ShareViewController : UIViewController <UIDocumentInteractionControllerDelegate,MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate> {
    
    SLComposeViewController *SLComposer;
    SLComposeViewController *twitterSLComposer;
    
}


@property (nonatomic, strong) UIDocumentInteractionController *docController;
- (IBAction)iMessageButton:(id)sender;
- (IBAction)facebookButton:(id)sender;
- (IBAction)twitterButtonPressed:(id)sender;
@property (strong) NSManagedObjectModel *device;
@property QuoteData *quoteData;

@end
