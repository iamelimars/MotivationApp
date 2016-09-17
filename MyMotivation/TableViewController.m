//
//  TableViewController.m
//  MyMotivation
//
//  Created by iMac on 9/13/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "TableViewController.h"
#import <CoreData/CoreData.h>

@interface TableViewController ()

@property (weak, nonatomic) NativeAdCell *AdCell;
@property(nonatomic) int AdCount;
@property (strong) NSMutableArray *devices;

@end

@implementation TableViewController

@synthesize AdCell;


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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //[self requestAd];
    NSLog(@"ViewLoaded");
    
    AdCell.ExpressNativeBanner.adUnitID = @"ca-app-pub-9906091830733745/6715656918";
    AdCell.ExpressNativeBanner.rootViewController = self;
    //self.ExpressNativeBanner.frame = CGRectMake(0.0, 0.0, AdCell.contentView.frame.size.width, AdCell.frame.size.height);
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            @"fd3efe9a2aa0d5b371f5a7e868f7d08a",
                            kGADSimulatorID // Eli's Iphone
                            ];
    [AdCell.ExpressNativeBanner loadRequest:[GADRequest request]];
    
}
-(void)viewDidAppear:(BOOL)animated {
    
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated {
    
    self.AdCount = 0;
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 25;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (9 == (indexPath.row % 10)) {  // or 9 == if you don't want the first cell to be an ad!
        AdCell = (NativeAdCell *)[tableView dequeueReusableCellWithIdentifier:@"AdCell"];
        
        if (self.AdCount <= 2) {
            [self requestAd];
            self.AdCount++;
            NSLog(@"nilll");
        }
        
        
        
        
        return AdCell;
        
    
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
        cell.textLabel.text = @"Test";
        return cell;
    }
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self performSegueWithIdentifier:@"toVersePage" sender:self];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (9 == (indexPath.row % 10)) {  // or 9 == if you don't want the first cell to be an ad!
        return 200;
        
        
    } else {
        
        return 50;
    }
    
    
}

-(void)requestAd {
    
    
    AdCell.ExpressNativeBanner.adUnitID = @"ca-app-pub-9906091830733745/6715656918";
    AdCell.ExpressNativeBanner.rootViewController = self;
    //self.ExpressNativeBanner.frame = CGRectMake(0.0, 0.0, AdCell.contentView.frame.size.width, AdCell.frame.size.height);
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            @"fd3efe9a2aa0d5b371f5a7e868f7d08a",
                            kGADSimulatorID // Eli's Iphone
                            ];
    [AdCell.ExpressNativeBanner loadRequest:[GADRequest request]];
    
    
    /*
    self.bannerView.adUnitID = @"ca-app-pub-9906091830733745/6715656918";
    self.bannerView.rootViewController = self;
    //self.bannerView.frame = CGRectMake(0.0, 0.0, 320.0, 50.0);
    GADRequest *request = [GADRequest request];
    request.testDevices = @[
                            @"fd3efe9a2aa0d5b371f5a7e868f7d08a"  // Eli's Iphone
                            ];
    [self.bannerView loadRequest:[GADRequest request]];
    */
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
