//
//  SettingsTableViewController.h
//  MyMotivation
//
//  Created by iMac on 9/23/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (IBAction)saveButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *notificationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *iconBadgesSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *notificationsSwitch;
- (IBAction)notificationSwitchChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *iconBadgesChanged;
@property (weak, nonatomic) IBOutlet UISwitch *iconChanged;
@property (weak, nonatomic) IBOutlet UILabel *setReminderLabel;

@property (weak, nonatomic) IBOutlet UILabel *dailyNotifyLabel;




@end
