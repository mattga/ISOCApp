//
//  DonationViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/5/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "DonationViewController.h"

@implementation DonationViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
	[self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[SVProgressHUD dismiss];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedDonationsTVC"]) {
		donationTVC = segue.destinationViewController;
	}
}

- (IBAction)confirmPressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"donationPageURL"]]];
}

@end
