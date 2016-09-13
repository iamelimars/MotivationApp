//
//  ViewController3.m
//  MyMotivation
//
//  Created by iMac on 8/27/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "ViewController3.h"
//#import <CoreData/CoreData.h>

@interface ViewController3 ()

//@property (strong) NSMutableArray *devices;


@end

@implementation ViewController3
/*
-(NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    
    return context;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self loadBanner];
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
    
}
/*
-(void)viewDidAppear:(BOOL)animated {
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier];
        cell.textLabel.text = @"New Row";
    }
    return cell;
    
}
*/
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
