//
//  SadaqatulFitrViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/30/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SadaqatulFitrViewController.h"
#import "CheckoutViewController.h"

@implementation SadaqatulFitrViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
	[self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[SVProgressHUD dismiss];
}

- (void)dismissKeyboard:(id)sender {
	amount = 10. * self.numPeopleTextField.text.intValue;
	self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", amount];
	
	if (amount == 0.)
		self.confirmButton.enabled = NO;
	else
		self.confirmButton.enabled = YES;
	
	[self.numPeopleTextField resignFirstResponder];
}


- (IBAction)confirmPressed:(id)sender {
	NSDictionary *params = @{@"amt"	: [NSString stringWithFormat:@"%.2f", amount],
							 @"dt"	: @"Sadaqatul Fitr"};
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	CheckoutViewController *vc = [sb instantiateViewControllerWithIdentifier:@"inPersonVC"];
	vc.ccConfirm = [ISOCDataProvider valueForKey:@"fitrPostCCpayment"];
	vc.ipConfirm = [ISOCDataProvider valueForKey:@"fitrPostPayInPerson"];
	vc.params = params;
	
	[self.navigationController pushViewController:vc animated:YES];
}

@end
