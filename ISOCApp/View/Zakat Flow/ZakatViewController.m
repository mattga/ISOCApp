//
//  ZakatViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "ZakatViewController.h"

@implementation ZakatViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:calcTVC action:@selector(dismissKeyboard:)];
	[self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[SVProgressHUD dismiss];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedZakatCalc"]) {
		calcTVC = segue.destinationViewController;
	}
}

- (void)dismissKeyboard:(id)sender {
	[self updateZakatTotal];
	[self.view endEditing:YES];
}

- (IBAction)continuePressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"donationPageURL"]]];
}

- (void)updateZakatTotal {
	amount = 0.0;
	if (calcTVC.enterAmountButton.selected) {
		amount = calcTVC.amountField.text.doubleValue;
		self.totalField.text = [NSString stringWithFormat:@"$%.2f", amount];
	} else {
		amount += calcTVC.calcField1.text.doubleValue;
		amount += calcTVC.calcField2.text.doubleValue;
		amount += calcTVC.calcField3.text.doubleValue;
		amount += calcTVC.calcField4.text.doubleValue;
		amount += calcTVC.calcField5.text.doubleValue;
		amount += calcTVC.calcField6.text.doubleValue;
		amount += calcTVC.calcField7.text.doubleValue;
		amount += calcTVC.calcField8.text.doubleValue;
		amount += calcTVC.calcField9.text.doubleValue;
		if (amount > 3550.0) {
			self.totalField.text = [NSString stringWithFormat:@"$%.2f", .025*amount];
		} else {
			amount = 0.;
			self.totalField.text = @"$0.00";
		}
	}
	
	if (amount == 0.)
		self.confirmButton.enabled = NO;
	else
		self.confirmButton.enabled = YES;
}

@end
