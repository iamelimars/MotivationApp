//
//  VersesViewController.m
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "VersesViewController.h"

@interface VersesViewController ()

@end

@implementation VersesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.NativeExpressAd.adUnitID = @"ca-app-pub-9906091830733745/6715656918";
    self.NativeExpressAd.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID ];
    [self.NativeExpressAd loadRequest:request];
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
