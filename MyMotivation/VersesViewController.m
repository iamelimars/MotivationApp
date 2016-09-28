//
//  VersesViewController.m
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "VersesViewController.h"
#import <CoreData/CoreData.h>

@interface VersesViewController ()

@end

@implementation VersesViewController


-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadBanner];
    /*
    self.NativeExpressAd.adUnitID = @"ca-app-pub-9906091830733745/6715656918";
    self.NativeExpressAd.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID ];
    [self.NativeExpressAd loadRequest:request];
    */
    if (self.device) {
        //self.verseTextView.textColor = [UIColor blackColor];
        [self.verseTextView setText:[self.device valueForKey:@"verse"]];
        self.referenceLabel.text = [NSString stringWithFormat:@"%@, %@", [self.device valueForKey:@"reference"], [self.device valueForKey:@"version"]];
        //[self.referenceLabel setText:[self.device valueForKey:@"reference"]];
        //[self.versionTextField setText:[self.device valueForKey:@"version"]];
        
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadBanner {
    
    bannerConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(bannerConcurrentQueue, ^(void) {
        
        self.bannerView.adUnitID = @"ca-app-pub-9906091830733745/7340255714";
        self.bannerView.rootViewController = self;
        GADRequest *request = [GADRequest request];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [self.bannerView loadRequest:[GADRequest request]];
            
        });
        
    });
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)imessageButton:(id)sender {
    
    MFMessageComposeViewController *textComposer = [[MFMessageComposeViewController alloc] init];
    [textComposer setMessageComposeDelegate:self];
    
    if ([MFMessageComposeViewController canSendText]) {
        [textComposer setRecipients:NULL];
        [textComposer setBody:[NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from the Versify App", [self.device valueForKey:@"verse"] ,[self.device valueForKey:@"reference"], [self.device valueForKey:@"version"]]];
        [self presentViewController:textComposer animated:YES completion:NULL];
        
    } else {
        
        NSLog(@"Error");
        
    }

    
}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)facebookButton:(id)sender {
    
    
    MFMailComposeViewController *imageEmail = [[MFMailComposeViewController alloc]init];
    imageEmail.mailComposeDelegate = self;
    [imageEmail setSubject:@"Verse from Versify App"];
    NSString *bodyOfEmail = [NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from the Versify App", [self.device valueForKey:@"verse"] ,[self.device valueForKey:@"reference"], [self.device valueForKey:@"version"]];
    [imageEmail setMessageBody:bodyOfEmail isHTML:NO];
    
    [self presentViewController:imageEmail animated:YES completion:NULL];

    /*
    SLComposer = [[SLComposeViewController alloc]init];
    SLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [SLComposer setInitialText:[NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from Daily Verse App", [self.device valueForKey:@"verse"] ,[self.device valueForKey:@"reference"], [self.device valueForKey:@"version"]]];
    [self presentViewController:SLComposer animated:YES completion:nil];
    */
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)twitterButton:(id)sender {
    
    twitterSLComposer = [[SLComposeViewController alloc]init];
    twitterSLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterSLComposer setInitialText:[NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from the Versify App", [self.device valueForKey:@"verse"] ,[self.device valueForKey:@"reference"], [self.device valueForKey:@"version"]]];
    [self presentViewController:twitterSLComposer animated:YES completion:nil];
    
}
@end
