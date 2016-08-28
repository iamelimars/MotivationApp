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
    self.visualExxectView.layer.cornerRadius = 5.0;
    self.visualExxectView.clipsToBounds = YES;
    
    //self.titleLabel.text = [NSString stringWithFormat:@"Verse Of The Day %C", ue148];
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
