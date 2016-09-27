//
//  CreateSavedViewController.m
//  MyMotivation
//
//  Created by iMac on 9/15/16.
//  Copyright © 2016 Marshall. All rights reserved.
//

#import "CreateSavedViewController.h"
#import <CoreData/CoreData.h>

@interface CreateSavedViewController ()

@property (weak, nonatomic) UITextField *activeField;

@end

@implementation CreateSavedViewController
@synthesize scrollView, activeField, device;

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
    // Do any additional setup after loading the view.
    
    self.verseTextView.textColor = [UIColor lightGrayColor];
    self.verseTextView.delegate = self;
    scrollView.delegate = self;
    
    //scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    //double viewHeight = self.view.frame.size.height;
    //self.contentHeightConstraint.constant = self.view.frame.size.height;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    if (self.device) {
        self.verseTextView.textColor = [UIColor blackColor];
        [self.verseTextView setText:[self.device valueForKey:@"verse"]];
        [self.referenceTextField setText:[self.device valueForKey:@"reference"]];
        [self.versionTextField setText:[self.device valueForKey:@"version"]];

    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    if (!self.device) {
        
        self.verseTextView.text = @"";
        self.verseTextView.textColor = [UIColor blackColor];
        
    }
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if (!self.device) {
        if(self.verseTextView.text.length == 0){
            self.verseTextView.textColor = [UIColor lightGrayColor];
            self.verseTextView.text = @"Type Here: 1 In the beginning God created the heavens and the earth. 2 Now the earth was formless and empty, darkness was over the surface of the deep, and the Spirit of God was hovering over the waters.";
            [self.verseTextView resignFirstResponder];
        }
    }
}

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}
- (IBAction)textFieldDidBeginEditing:(UITextField *)sender
{
    self.activeField = sender;
}

- (IBAction)textFieldDidEndEditing:(UITextField *)sender
{
    self.activeField = nil;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveDataButton:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
   
    if (self.device) {
        [self.device setValue:self.verseTextView.text forKey:@"verse"];
        [self.device setValue:self.referenceTextField.text forKey:@"reference"];
        [self.device setValue:self.versionTextField.text forKey:@"version"];
    } else {
    
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:self.verseTextView.text forKey:@"verse"];
        [newDevice setValue:self.referenceTextField.text forKey:@"reference"];
        [newDevice setValue:self.versionTextField.text forKey:@"version"];
    
    }
        
    NSError *error = nil;
    
    if (![context save:&error]) {
        
        NSLog(@"%@,  %@", error, [error localizedDescription]);
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)DismissKeyboard:(id)sender {
    
    [self resignFirstResponder];
    
}
@end
