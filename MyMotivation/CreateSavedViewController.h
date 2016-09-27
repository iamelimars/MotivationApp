//
//  CreateSavedViewController.h
//  MyMotivation
//
//  Created by iMac on 9/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateSavedViewController : UIViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *verseTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeightConstraint;
@property (weak, nonatomic) IBOutlet UITextField *referenceTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;

@property (strong) NSManagedObjectModel *device;


- (IBAction)saveDataButton:(id)sender;
- (IBAction)DismissKeyboard:(id)sender;

@end
