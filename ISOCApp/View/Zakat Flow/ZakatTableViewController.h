//
//  ZakatTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTableViewController.h"

@interface ZakatTableViewController : BaseTableViewController

@property (weak, nonatomic) IBOutlet UIButton *enterAmountButton;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UITextField *calcField1;
@property (weak, nonatomic) IBOutlet UITextField *calcField2;
@property (weak, nonatomic) IBOutlet UITextField *calcField3;
@property (weak, nonatomic) IBOutlet UITextField *calcField4;
@property (weak, nonatomic) IBOutlet UITextField *calcField5;
@property (weak, nonatomic) IBOutlet UITextField *calcField6;
@property (weak, nonatomic) IBOutlet UITextField *calcField7;
@property (weak, nonatomic) IBOutlet UITextField *calcField8;
@property (weak, nonatomic) IBOutlet UITextField *calcField9;

- (IBAction)enterAmountPressed:(id)sender;
- (IBAction)calculatePressed:(id)sender;

@end
