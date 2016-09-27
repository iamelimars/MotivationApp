//
//  SettingsTableViewController.m
//  MyMotivation
//
//  Created by iMac on 9/23/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL status = [defaults boolForKey:@"notification"];
    if (status == TRUE) {
        
        self.setReminderLabel.userInteractionEnabled = YES;
        self.datePicker.userInteractionEnabled = YES;
        self.timeLabel.userInteractionEnabled = YES;
        
        self.setReminderLabel.alpha = 1.0;
        self.datePicker.alpha = 1.0;
        self.timeLabel.alpha = 1.0;
        self.dailyNotifyLabel.alpha = 1.0;
    } else {
        
        self.setReminderLabel.userInteractionEnabled = NO;
        self.datePicker.userInteractionEnabled = NO;
        self.timeLabel.userInteractionEnabled = NO;
        
        self.setReminderLabel.alpha = 0.4;
        self.datePicker.alpha = 0.4;
        self.timeLabel.alpha = 0.4;
        self.dailyNotifyLabel.alpha = 0.4;
        
    }
    [self.notificationsSwitch setOn:[defaults boolForKey:@"notification"]];
    [self.setReminderLabel setText:[defaults objectForKey:@"reminderLabel"]];
    
}
-(void)dateChanged:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm a"];
    NSString *currentTime = [dateFormatter stringFromDate:self.datePicker.date];
    self.timeLabel.text = currentTime;

    
}
/*
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
    
}
*/

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

- (IBAction)saveButton:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.notificationsSwitch.on forKey:@"notification"];
    [defaults synchronize];
    
    if ([self.notificationsSwitch isOn]) {
       
    
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
        NSDate *pickerDate = [self.datePicker date];
    
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = pickerDate;
        localNotification.alertBody = @"Verse of the Day!";
        localNotification.alertAction = @"View";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.repeatInterval = kCFCalendarUnitDay;
        localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] +1;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
        NSArray *nofiCount = [[UIApplication sharedApplication] scheduledLocalNotifications];
        UILocalNotification *newNotification = nofiCount[0];
        NSLog(@"newnoti %@", newNotification.alertBody);
        NSLog(@"%lu", (unsigned long)nofiCount.count);
        NSLog(@"Scheduled %@", pickerDate);
        
        
        //Change setTimeLabel
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"hh:mm a"];
        NSString *currentTime = [dateFormatter stringFromDate:self.datePicker.date];
        self.setReminderLabel.text = [NSString stringWithFormat:@"Currently set for %@ everyday", currentTime];
        
        //Saving String to NSUserDefaults
        NSUserDefaults *reminderDefaults = [NSUserDefaults standardUserDefaults];
        [reminderDefaults setObject:self.setReminderLabel.text forKey:@"reminderLabel"];
        [reminderDefaults synchronize];
        
        
    } else {
        NSArray *nofiCount = [[UIApplication sharedApplication] scheduledLocalNotifications];
        NSLog(@"%lu", (unsigned long)nofiCount.count);

        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        NSLog(@"OFF");
    }
}
- (IBAction)notificationSwitchChanged:(id)sender {
    
    BOOL state = self.notificationsSwitch.on;
    if (state == TRUE) {
        
        
        self.setReminderLabel.userInteractionEnabled = YES;
        self.datePicker.userInteractionEnabled = YES;
        self.timeLabel.userInteractionEnabled = YES;
        
        self.setReminderLabel.alpha = 1.0;
        self.datePicker.alpha = 1.0;
        self.timeLabel.alpha = 1.0;
        self.dailyNotifyLabel.alpha = 1.0;
        
        NSLog(@"true");
    } else {
        
        self.setReminderLabel.userInteractionEnabled = NO;
        self.datePicker.userInteractionEnabled = NO;
        self.timeLabel.userInteractionEnabled = NO;
        
        self.setReminderLabel.alpha = 0.4;
        self.datePicker.alpha = 0.4;
        self.timeLabel.alpha = 0.4;
        self.dailyNotifyLabel.alpha = 0.4;
        
        
        
        
        NSLog(@"false");
        
    }
    
}
@end
