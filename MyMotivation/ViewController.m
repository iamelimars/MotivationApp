//
//  ViewController.m
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize view2;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myScrollView.delegate = self;
    [self createPageViewController];
    [self getVerseOfDay];
    [self loadBanner];
    CGRect frame = self.myScrollView.frame;
    frame.origin.x = frame.size.width * 1;
    frame.origin.y = 0;
    self.myScrollView.contentOffset = CGPointMake(self.view.frame.size.width*1.0, 0);

    
}

-(void)createPageViewController {
    /*
    StartConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(StartConcurrentQueue, ^(void){
        NSString *fullURL = @"https://www.bible.com/bible/1/jhn.1";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            ViewController1 *view1 = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
            view2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
            ViewController3 *view3 = [[ViewController3 alloc]initWithNibName:@"ViewController3" bundle:nil];
            
            //Add UIVC's to scroll view
            [self addChildViewController:view1];
            [self.myScrollView addSubview:view1.view];
            [view1 didMoveToParentViewController:self];
            
            [self addChildViewController:view2];
            [self.myScrollView addSubview:view2.view];
            [view2 didMoveToParentViewController:self];
            
            [self addChildViewController:view3];
            [self.myScrollView addSubview:view3.view];
            [view3 didMoveToParentViewController:self];
            
            //Changing width of scroll view to fit UIVC's
            CGRect V2Frame = view2.view.frame;
            V2Frame.origin.x = self.view.frame.size.width;
            view2.view.frame = V2Frame;
            
            
            [view1.bibleWebView loadRequest:requestObj];
            
            CGRect V3Frame = view3.view.frame;
            V3Frame.origin.x = 2 * self.view.frame.size.width;
            view3.view.frame = V3Frame;
            
            self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
            
            
        });
        
    });
    */
    
    //UIViewControllers In ScrollView
    //Loading NIB of UIVC's
    ViewController1 *view1 = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
    view2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
    ViewController3 *view3 = [[ViewController3 alloc]initWithNibName:@"ViewController3" bundle:nil];
    
    //Add UIVC's to scroll view
    [self addChildViewController:view1];
    [self.myScrollView addSubview:view1.view];
    [view1 didMoveToParentViewController:self];
    
    [self addChildViewController:view2];
    [self.myScrollView addSubview:view2.view];
    [view2 didMoveToParentViewController:self];
    
    [self addChildViewController:view3];
    [self.myScrollView addSubview:view3.view];
    [view3 didMoveToParentViewController:self];
    
    //Changing width of scroll view to fit UIVC's
    CGRect V2Frame = view2.view.frame;
    V2Frame.origin.x = self.view.frame.size.width;
    view2.view.frame = V2Frame;
    
    
    
    StartConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(StartConcurrentQueue, ^(void){
        NSString *fullURL = @"https://www.bible.com/bible/1/jhn.1";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [view1.bibleWebView loadRequest:requestObj];
        });
    });
    
    
    CGRect V3Frame = view3.view.frame;
    V3Frame.origin.x = 2 * self.view.frame.size.width;
    view3.view.frame = V3Frame;
    
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
    
    
   
    
}


- (void)getVerseOfDay {
    
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.ourmanna.com/verses/api/get/?format=json"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    mConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(mConcurrentQueue, ^(void){
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSDictionary *verse = json[@"verse"];
        NSDictionary *details = verse[@"details"];
        NSString *reference = details[@"reference"];
        NSString *version = details[@"version"];
        NSString *text = [NSString stringWithFormat:@"%@", details[@"text"]];
        NSLog(@"json: %@", details);
        NSLog(@"text: %@", text);
        NSString *referenceText = [NSString stringWithFormat:@"%@, %@", reference, version];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            view2.verseTextView.text = text;
            view2.referenceLabel.text = referenceText;
            
        });
        
        
    });
    
}
- (void)getRandomVerse {
    
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.ourmanna.com/verses/api/get/?format=json"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    mConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(mConcurrentQueue, ^(void){
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSDictionary *verse = json[@"verse"];
        NSDictionary *details = verse[@"details"];
        NSString *reference = details[@"reference"];
        NSString *version = details[@"version"];
        NSString *text = [NSString stringWithFormat:@"%@", details[@"text"]];
        NSLog(@"json: %@", details);
        NSLog(@"text: %@", text);
        NSString *referenceText = [NSString stringWithFormat:@"%@, %@", reference, version];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            view2.verseTextView.text = text;
            view2.referenceLabel.text = referenceText;
            
        });
        
        
    });
    
}


-(void) loadBanner {
    
    bannerConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
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
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    //Change the Index of pagecontrol
    int indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    
    switch (indexOfPage) {
        case 0:
            self.myPageControl.currentPage = 0;
            self.bannerView.hidden = YES;
            break;
        case 1:
            self.myPageControl.currentPage = 1;
            self.bannerView.hidden = NO;
            break;
        case 2:
            self.myPageControl.currentPage = 2;
            self.bannerView.hidden = NO;
            break;
            
        default:
            break;
    }
    //your stuff with index
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
