//
//  ViewController1.m
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController1.h"


@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    /*

    NSString *fullURL = @"https://www.bible.com/bible/1/jhn.1";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.bibleWebView loadRequest:requestObj];
*/
    
    self.bibleWebView.delegate = self;
    activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeNineDots tintColor:[UIColor flatWatermelonColor] size:40.0f];
    activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    
    [self.animationView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
-(void)viewDidAppear:(BOOL)animated {
    
    StartConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(StartConcurrentQueue, ^(void){
        NSString *fullURL = @"https://www.bible.com/bible/1/jhn.1";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.bibleWebView loadRequest:requestObj];
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

- (IBAction)refreshButtonPressed:(id)sender {
    [activityIndicatorView startAnimating];
    
    [self.bibleWebView reload];
}

/*
-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    NSLog(@"Loading...");
    
}
*/
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //Check here if still webview is loding the content
    if (webView.isLoading) {
        return;
    }
    
    //after code when webview finishes
    [activityIndicatorView stopAnimating];
}
@end
