//
//  ViewController.m
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "NYSegmentedControl.h"
#import <ChameleonFramework/Chameleon.h>


@interface ViewController ()

@property (strong) NSMutableArray *devices;

@end

@implementation ViewController

@synthesize view2, device, quoteData;

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
    // Do any additional setup after loading the view, typically from a nib.
    quoteData = [[QuoteData alloc]init];
    
    self.myScrollView.delegate = self;
    [self createPageViewController];
    [self getVerseOfDay];
    [self loadBanner]; 
    self.bannerView.hidden = YES;
    CGRect frame = self.myScrollView.frame;
    frame.origin.x = frame.size.width * 1;
    frame.origin.y = 0;
    self.myScrollView.contentOffset = CGPointMake(self.view.frame.size.width*1.0, 0);
    

}
-(void)viewWillAppear:(BOOL)animated{
    
     self.navigationController.navigationBarHidden = YES;
    
}

-(void)viewDidAppear:(BOOL)animated {
    
   
    
}
-(void)savedButtonPressed {
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    
    [newDevice setValue:quoteData.verse forKey:@"verse"];
    [newDevice setValue:quoteData.reference forKey:@"reference"];
    [newDevice setValue:quoteData.version forKey:@"version"];
    
    NSError *error = nil;
    
    if (![context save:&error]) {
        
        NSLog(@"%@,  %@", error, [error localizedDescription]);
        
    }
    
    NSLog(@"SavedPressed");
    [self toSavedPage];
    
}
-(void)shareButtonPressed {
    
    [self performSegueWithIdentifier:@"toShareViewC" sender:self];
    
    
}
-(void) settingsButtonPressed {
    
    [self performSegueWithIdentifier:@"toSettingsPage" sender:self];
    
    
}
-(void)createPageViewController {
    
    
    
    //UIViewControllers In ScrollView
    //Loading NIB of UIVC's
    ViewController1 *view1 = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
    view2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
    ViewController3 *view3 = [[ViewController3 alloc]initWithNibName:@"ViewController3" bundle:nil];
    
    //Add UIVC's to scroll view
    [self addChildViewController:view1];
    [self.myScrollView addSubview:view1.view];
    [view1 didMoveToParentViewController:self];
    
    [self addChildViewController:view3];
    [self.myScrollView addSubview:view3.view];
    [view3 didMoveToParentViewController:self];
    
    
    [self addChildViewController:view2];
    [self.myScrollView addSubview:view2.view];
    [view2 didMoveToParentViewController:self];
    
    [view3.settingsButton addTarget:self action:@selector(settingsButtonPressed) forControlEvents:UIControlEventTouchDown];
    
    [view2.shareButton addTarget:self action:@selector(shareButtonPressed) forControlEvents:UIControlEventTouchDown];
    
    [view2.saveButton addTarget:self action:@selector(savedButtonPressed) forControlEvents:UIControlEventTouchDown];
    
    [view3.savedVersesButton addTarget:self action:@selector(toSavedPage) forControlEvents:UIControlEventTouchDown];
    
    //Changing width of scroll view to fit UIVC's
    CGRect V2Frame = view2.view.frame;
    V2Frame.origin.x = 2 * self.view.frame.size.width;
    view2.view.frame = V2Frame;
    
    CGRect V3Frame = view3.view.frame;
    V3Frame.origin.x = self.view.frame.size.width;
    view3.view.frame = V3Frame;

    //Setup activity indicator
    activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeNineDots tintColor:[UIColor whiteColor] size:40.0f];
    activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    [view2.animationView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    //set background color of views
    view3.view.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleRadial withFrame:self.view.frame andColors:@[[UIColor flatWhiteColor],[UIColor flatPowderBlueColor]]];
    view2.view.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleRadial withFrame:self.view.frame andColors:@[[UIColor flatWhiteColor],[UIColor flatPowderBlueColor]]];
    
    //Set up segmented control
    segmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"Verse Of The Day", @"Random Verse"]];
    segmentedControl.frame = CGRectMake(0.0, 0.0, view2.segmentedControlView.frame.size.width, view2.segmentedControlView.frame.size.height);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue) forControlEvents:UIControlEventValueChanged];
    [view2.segmentedControlView addSubview:segmentedControl];
    segmentedControl.titleTextColor = [UIColor flatBlueColorDark];
    segmentedControl.selectedTitleTextColor = [UIColor whiteColor];
    segmentedControl.selectedTitleFont = [UIFont systemFontOfSize:13.0f];
    segmentedControl.segmentIndicatorBackgroundColor = [UIColor flatBlueColorDark];
    segmentedControl.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4];
    segmentedControl.borderWidth = 0.0f;
    segmentedControl.segmentIndicatorBorderWidth = 0.0f;
    segmentedControl.segmentIndicatorInset = 2.0f;
    segmentedControl.segmentIndicatorBorderColor = self.view.backgroundColor;
    [segmentedControl sizeToFit];
    segmentedControl.cornerRadius = CGRectGetHeight(segmentedControl.frame) / 2.0f;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    segmentedControl.usesSpringAnimations = YES;
#endif 
    
    //set scroll view content size
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
}

-(void)toSavedPage {
    
    self.navigationController.navigationBarHidden = NO;
    [self performSegueWithIdentifier:@"ToSavedPage" sender:self];
    
}

-(void)segmentedControlChangedValue {
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            NSLog(@"VOD");
            [self getVerseOfDay];
            break;
        case 1:
            NSLog(@"Random");
            [self getRandomVerse];
            break;
            
        default:
            break;
    }
    
    
}

- (void)getVerseOfDay {
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        view2.verseTextView.text = nil;
        view2.referenceLabel.text = nil;
        [activityIndicatorView startAnimating];
        
    });
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.ourmanna.com/verses/api/get/?format=json"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    mConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(mConcurrentQueue, ^(void){
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //NSLog(@"%@", &error);
        NSDictionary *verse = json[@"verse"];
        NSDictionary *details = verse[@"details"];
        NSString *reference = details[@"reference"];
        NSString *version = details[@"version"];
        NSString *text = [NSString stringWithFormat:@"%@", details[@"text"]];
        NSString *referenceText = [NSString stringWithFormat:@"%@, %@", reference, version];
        
        quoteData.verse = text;
        quoteData.reference = [NSString stringWithFormat:@"%@", reference];
        quoteData.version = [NSString stringWithFormat:@"%@", version];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [activityIndicatorView stopAnimating];
            
            if ([text  isEqual: @"(null)"]) {
                NSLog(@"Sorry we couldnt get the verse of the day for you, Try again later");
                view2.verseTextView.text = @"Sorry we couldnt get the verse of the day for you, Try again later?";
                view2.referenceLabel.text = @"Sorry.";
            } else {
            
                view2.verseTextView.text = text;
                view2.referenceLabel.text = referenceText;
            }
            
        });
        
        
    });
    
}
- (void)getRandomVerse {
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        view2.verseTextView.text = nil;
        view2.referenceLabel.text = nil;
        [activityIndicatorView startAnimating];
    });
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.ourmanna.com/verses/api/get/?format=json&order=random"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    mConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(mConcurrentQueue, ^(void){
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *verse = json[@"verse"];
        NSDictionary *details = verse[@"details"];
        NSString *reference = details[@"reference"];
        NSString *version = details[@"version"];
        NSString *text = [NSString stringWithFormat:@"%@", details[@"text"]];
        NSString *referenceText = [NSString stringWithFormat:@"%@, %@", reference, version];
        
        quoteData.verse = text;
        quoteData.reference = [NSString stringWithFormat:@"%@", reference];
        quoteData.version = [NSString stringWithFormat:@"%@", version];

        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [activityIndicatorView stopAnimating];

            if ([text  isEqual: @"(null)"]) {
                NSLog(@"Sorry we couldnt get the verse of the day for you, Try again later");
                view2.verseTextView.text = @"Sorry we couldnt get a random verse for you, Try again later?";
                view2.referenceLabel.text = @"Sorry.";
            } else {
                
                view2.verseTextView.text = text;
                view2.referenceLabel.text = referenceText;
            }
            
        });
        
    });
    
}


-(void) loadBanner {
    
    bannerConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(bannerConcurrentQueue, ^(void) {
        
        self.bannerView.adUnitID = @"ca-app-pub-9906091830733745/7340255714";
        self.bannerView.rootViewController = self;
        GADRequest *request = [GADRequest request];
        //request.testDevices = @[
        //                        @"fd3efe9a2aa0d5b371f5a7e868f7d08a"  // Eli's Iphone
        //                        ];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self.bannerView loadRequest:[GADRequest request]];
        });
        _bannerView.delegate = nil;
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
            self.bannerView.hidden = YES;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"toShareViewC"]) {
        //NSManagedObjectModel *selectedDevice = [self.devices objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
        ShareViewController *addView = segue.destinationViewController;
        addView.quoteData = quoteData;
        
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

@end
