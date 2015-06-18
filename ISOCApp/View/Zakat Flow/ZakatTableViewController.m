
//
//  ZakatTableViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "ZakatTableViewController.h"
#import "ZakatViewController.h"

@implementation ZakatTableViewController

- (IBAction)enterAmountPressed:(id)sender {
	self.enterAmountButton.selected = YES;
	self.calculateButton.selected = NO;
	
	self.amountField.enabled = YES;
	self.calcField1.enabled = NO;
	self.calcField2.enabled = NO;
	self.calcField3.enabled = NO;
	self.calcField4.enabled = NO;
	self.calcField5.enabled = NO;
	self.calcField6.enabled = NO;
	self.calcField7.enabled = NO;
	self.calcField8.enabled = NO;
	self.calcField9.enabled = NO;
	self.amountField.alpha = 1.0f;
	self.calcField1.alpha = .6f;
	self.calcField2.alpha = .6f;
	self.calcField3.alpha = .6f;
	self.calcField4.alpha = .6f;
	self.calcField5.alpha = .6f;
	self.calcField6.alpha = .6f;
	self.calcField7.alpha = .6f;
	self.calcField8.alpha = .6f;
	self.calcField9.alpha = .6f;
	
	[(ZakatViewController*)self.parentViewController updateZakatTotal];
}

- (IBAction)calculatePressed:(id)sender {
	self.enterAmountButton.selected = NO;
	self.calculateButton.selected = YES;
	
	self.amountField.enabled = NO;
	self.calcField1.enabled = YES;
	self.calcField2.enabled = YES;
	self.calcField3.enabled = YES;
	self.calcField4.enabled = YES;
	self.calcField5.enabled = YES;
	self.calcField6.enabled = YES;
	self.calcField7.enabled = YES;
	self.calcField8.enabled = YES;
	self.calcField9.enabled = YES;
	self.amountField.alpha = .6f;
	self.calcField1.alpha = 1.0f;
	self.calcField2.alpha = 1.0f;
	self.calcField3.alpha = 1.0f;
	self.calcField4.alpha = 1.0f;
	self.calcField5.alpha = 1.0f;
	self.calcField6.alpha = 1.0f;
	self.calcField7.alpha = 1.0f;
	self.calcField8.alpha = 1.0f;
	self.calcField9.alpha = 1.0f;
	
	[(ZakatViewController*)self.parentViewController updateZakatTotal];
}

@end
