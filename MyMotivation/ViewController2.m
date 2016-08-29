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
@synthesize visualExxectView, titleLabel, shareButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.visualExxectView.layer.cornerRadius = 5.0;
    self.visualExxectView.clipsToBounds = YES;
    
    shareButton.layer.cornerRadius = 4.0;
    shareButton.clipsToBounds = YES;
    shareButton.backgroundColor = [UIColor clearColor];
    shareButton.layer.borderWidth = 0.5;
    shareButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self getVerse];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getVerse {
    
    @autoreleasepool {
    
    
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ourmanna.com/verses/api/get?format=json"]];
    //NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://labs.bible.org/api/?passage=random&type=json"]];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"]];

    
    //http://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en
        if (data ==  nil) {
        
            NSLog(@"error");
        }
        
        
    
        NSError *jsonParsingError = nil;
        NSDictionary *verse = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingAllowFragments error:&jsonParsingError];
    
        self.textView.text = verse[@"quoteText"];
        NSString *author = verse[@"quoteAuthor"];
        self.authorLabel.text = [NSString stringWithFormat:@"By. %@", author];
        
        if (!verse) {
        
            NSLog(@"Error parsing json %@",jsonParsingError);
        
        }
        NSLog(@"%@", verse);
    
    //NSURLRequest *request = [NSURLRequest requestWi]
    }
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
