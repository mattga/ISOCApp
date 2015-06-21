//
//  SadaqatulFitrViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/30/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SadaqatulFitrViewController.h"

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
	NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
	url = [NSString stringWithFormat:@"%@?amt=%.2f", url, amount];
	url = [NSString stringWithFormat:@"%@&dt=fitr", url];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	NSLog(@"Opening url: %@", url);
}

@end
