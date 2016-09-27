//
//  VerseLabel.m
//  MyMotivation
//
//  Created by iMac on 9/20/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "VerseLabel.h"

@implementation VerseLabel


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = 8.0;
    self.clipsToBounds = YES;
}


@end
