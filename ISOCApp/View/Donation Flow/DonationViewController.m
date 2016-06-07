//
//  DonationViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/5/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "DonationViewController.h"
#import "CheckoutViewController.h"

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
	NSDictionary *params = @{@"amt"	: [NSString stringWithFormat:@"%.2f", amount],
							 @"dt"	: @"General Donation",
							 @"not"	: [NSString stringWithFormat:@"masjid:%.2f,ocs:%.2f,social:%.2f,funeral:%.2f", masjidAmt, ocsAmt, socialAmt, funeralAmt]};
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	CheckoutViewController *vc = [sb instantiateViewControllerWithIdentifier:@"inPersonVC"];
	vc.ccConfirm = [ISOCDataProvider valueForKey:@"generalPostCCpayment"];
	vc.ipConfirm = [ISOCDataProvider valueForKey:@"generalPostPayInPerson"];
	vc.params = params;
	
	[self.navigationController pushViewController:vc animated:YES];
}

@end
