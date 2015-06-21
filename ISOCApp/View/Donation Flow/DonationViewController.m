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

- (void)dismissKeyboard:(id)sender {
	masjidAmt = donationTVC.masjidField.text.doubleValue;
	ocsAmt = donationTVC.schoolField.text.doubleValue;
	socialAmt = donationTVC.socialField.text.doubleValue;
	funeralAmt = donationTVC.funeralField.text.doubleValue;
	[self.view endEditing:YES];
	[self setAmount];
}

- (void)setAmount {
	amount = masjidAmt + ocsAmt + socialAmt + funeralAmt;
	self.amountLabel.text = [NSString stringWithFormat:@"$%.2f", amount];
}

- (IBAction)confirmPressed:(id)sender {
	NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
	url = [NSString stringWithFormat:@"%@?amt=%.2f", url, amount];
	url = [NSString stringWithFormat:@"%@&dt=general", url];
	url = [NSString stringWithFormat:@"%@&not=masjid:%.2f,ocs:%.2f,social:%.2f,funeral:%.2f", url, masjidAmt, ocsAmt, socialAmt, funeralAmt];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	NSLog(@"Opening url: %@", url);
}

@end
