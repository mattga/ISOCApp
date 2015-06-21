//
//  InPersonTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/21/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTableViewController.h"

@interface CheckoutTableViewController : BaseTableViewController

@property (strong, nonatomic) NSDictionary *params;
@property (strong, nonatomic) NSString *ipConfirm, *ccConfirm;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *zipField;
@property (weak, nonatomic) IBOutlet UITextField *cellField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *onlineButton;
@property (weak, nonatomic) IBOutlet UIButton *inPersonButton;

- (IBAction)onlinePressed:(id)sender;
- (IBAction)inPersonPressed:(id)sender;

@end
