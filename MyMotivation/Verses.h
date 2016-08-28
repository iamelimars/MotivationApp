//
//  Verses.h
//  MyMotivation
//
//  Created by Elisha J Marshall III on 8/28/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Verses : NSObject {
    
    NSString *text_;
    NSString *reference_;
    NSString *version_;
    
}
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *reference;
@property (nonatomic, retain) NSString *version;

-(NSDictionary *)dictionary;

    

@end
