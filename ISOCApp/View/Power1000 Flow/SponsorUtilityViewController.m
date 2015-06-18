//
//  SponsorUtilityViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/7/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorUtilityViewController.h"

@implementation SponsorUtilityViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self loadContent];
}

- (void)loadContent {
	[ISOCDataProvider fetchStaticValue:@"gasBillAmt"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  NSString *s = [o.firstObject valueForKey:@"text"];
									  gasAmt = [s substringFromIndex:1].intValue;
									  tvc.gasAmtLabel.text = s;
								  });
							  }];
	[ISOCDataProvider fetchStaticValue:@"waterBillAmt"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  NSString *s = [o.firstObject valueForKey:@"text"];
									  waterAmt = [s substringFromIndex:1].intValue;
									  tvc.waterAmtLabel.text = s;
								  });
							  }];
	[ISOCDataProvider fetchStaticValue:@"trashBillAmt"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  NSString *s = [o.firstObject valueForKey:@"text"];
									  trashAmt = [s substringFromIndex:1].intValue;
									  tvc.trashAmtLabel.text = s;
								  });
							  }];
	[ISOCDataProvider fetchStaticValue:@"elecBillAmt"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  NSString *s = [o.firstObject valueForKey:@"text"];
									  elecAmt = [s substringFromIndex:1].intValue;
									  tvc.elecAmtLabel.text = s;
									  [SVProgressHUD dismiss];
								  });
							  }];
}

- (void)dismissKeyboard:(id)sender {
	[self setAmount];
	[self.view endEditing:YES];
}

- (void)setAmount {
	amount += gasAmt * tvc.gasField.text.intValue;
	amount += waterAmt * tvc.waterField.text.intValue;
	amount += trashAmt * tvc.trashField.text.intValue;
	amount += elecAmt * tvc.electricityField.text.intValue;
	
	self.amountLabel.text = [NSString stringWithFormat:@"$%d", amount];
	
	if (amount == 0.)
		self.confirmButton.enabled = NO;
	else
		self.confirmButton.enabled = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedTable"])
		tvc = segue.destinationViewController;
}

- (IBAction)continuePressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"donationPageURL"]]];
}

@end
