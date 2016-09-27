//
//  ViewController2.m
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
@synthesize visualExxectView, titleLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.visualExxectView.layer.cornerRadius = 8.0;
    self.visualExxectView.clipsToBounds = YES;
    
    //[self loadBanner];
    
    //[self getVerseOfDay];
}
- (void)viewDidAppear:(BOOL)animated {
    
    
    //[self getVerseOfDay];
    
    
}

-(void) loadBanner {
    
    bannerConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(bannerConcurrentQueue, ^(void) {
        
        self.bannerView.adUnitID = @"ca-app-pub-9906091830733745/7340255714";
        self.bannerView.rootViewController = self;
        GADRequest *request = [GADRequest request];
        request.testDevices = @[
                            @"fd3efe9a2aa0d5b371f5a7e868f7d08a"  // Eli's Iphone
                            ];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [self.bannerView loadRequest:[GADRequest request]];
            
        });
        
    });
    
    
}

- (void)getVerseOfDay {
    
    
    /*
    NSString *urlString = [NSString stringWithFormat:@"http://www.ourmanna.com/verses/api/get/?format=json"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    mConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(mConcurrentQueue, ^(void){
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"json: %@", json);
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            
        });
        
    });
    */
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

@end
