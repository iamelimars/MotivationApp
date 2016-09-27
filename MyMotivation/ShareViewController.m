//
//  ShareViewController.m
//  MyMotivation
//
//  Created by iMac on 9/20/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController
@synthesize quoteData;

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
    //quoteData = [[QuoteData alloc]init];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
}
-(void)viewDidAppear:(BOOL)animated {
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)iMessageButton:(id)sender {
    
    MFMessageComposeViewController *textComposer = [[MFMessageComposeViewController alloc] init];
    [textComposer setMessageComposeDelegate:self];
    
    if ([MFMessageComposeViewController canSendText]) {
        [textComposer setRecipients:NULL];
        [textComposer setBody:[NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from the Versify App", quoteData.verse ,quoteData.reference, quoteData.version]];
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
    NSString *bodyOfEmail = [NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from the Versify App", quoteData.verse ,quoteData.reference, quoteData.version];
    [imageEmail setMessageBody:bodyOfEmail isHTML:NO];

    [self presentViewController:imageEmail animated:YES completion:NULL];
    
    /*
    SLComposer = [[SLComposeViewController alloc]init];
    SLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [SLComposer setInitialText:[NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from Daily Verse App", quoteData.verse ,quoteData.reference, quoteData.version]];
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


- (IBAction)twitterButtonPressed:(id)sender {
    
    twitterSLComposer = [[SLComposeViewController alloc]init];
    twitterSLComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterSLComposer setInitialText:[NSString stringWithFormat:@"%@ \r \r %@, %@ \r \r Sent from the Versify App", quoteData.verse ,quoteData.reference, quoteData.version]];
    [self presentViewController:twitterSLComposer animated:YES completion:nil];
    
}
@end
