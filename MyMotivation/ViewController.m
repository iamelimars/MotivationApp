//
//  ViewController.m
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myScrollView.delegate = self;
    [self createPageViewController];
    
    CGRect frame = self.myScrollView.frame;
    frame.origin.x = frame.size.width * 1;
    frame.origin.y = 0;
    self.myScrollView.contentOffset = CGPointMake(self.view.frame.size.width*1.0, 0);

    
}

-(void)createPageViewController {
    
    //UIViewControllers In ScrollView
    //Loading NIB of UIVC's
    ViewController1 *view1 = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
    ViewController2 *view2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
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
    
    CGRect V3Frame = view3.view.frame;
    V3Frame.origin.x = 2 * self.view.frame.size.width;
    view3.view.frame = V3Frame;
    
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
    
   
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    //Change the Index of pagecontrol
    int indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"%i", indexOfPage);
    
    switch (indexOfPage) {
        case 0:
            self.myPageControl.currentPage = 0;
            break;
        case 1:
            self.myPageControl.currentPage = 1;
            break;
        case 2:
            self.myPageControl.currentPage = 2;
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
