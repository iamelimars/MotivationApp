//
//  RoundedButton.m
//  MyMotivation
//
//  Created by iMac on 9/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "RoundedButton.h"

@implementation RoundedButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    self.layer.cornerRadius = 3.0;
    self.clipsToBounds = YES;
}
-(void)roundCorners {
    
    
    
}

@end
