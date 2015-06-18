//
//  ZakatViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "ZakatTableViewController.h"

@interface ZakatViewController : DetailViewController {
	ZakatTableViewController *calcTVC;
	double amount;
}

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *totalField;

- (IBAction)continuePressed:(id)sender;

- (void)dismissKeyboard:(id)sender;
- (void)updateZakatTotal;

@end
