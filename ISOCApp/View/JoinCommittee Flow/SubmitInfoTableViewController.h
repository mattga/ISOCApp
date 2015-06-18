//
//  SubmitInfoViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTableViewController.h"

@interface SubmitInfoTableViewController : BaseTableViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (weak, nonatomic) IBOutlet UITextField *cellField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSwitch;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)submitPressed:(id)sender;

@end
