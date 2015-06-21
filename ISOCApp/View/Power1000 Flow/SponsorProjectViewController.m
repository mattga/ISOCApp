//
//  SponsorProjectViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorProjectViewController.h"

@implementation SponsorProjectViewController
@synthesize donation1, donation2, donation3, donation4, infoText, titleText;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
	[self.view addGestureRecognizer:tapGesture];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedSponsor"]) {
		tvc = segue.destinationViewController;
		if (infoText)
			tvc.infoText = infoText;
		tvc.titleText = titleText;
		tvc.amt1 = donation1;
		tvc.amt2 = donation2;
		tvc.amt3 = donation3;
		tvc.amt4 = donation4;
		[self setAmount:donation1];
	}
}

- (IBAction)continuePressed:(id)sender {
	NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
	url = [NSString stringWithFormat:@"%@?amt=%.2f", url, amount];
	url = [NSString stringWithFormat:@"%@&dt=%@", url, titleText];
	url = [NSString stringWithFormat:@"%@&not=project:%@", url, self.project];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	NSLog(@"Opening url: %@", url);
}

- (void)dismissKeyboard:(id)sender {
	double otherAmt = tvc.otherAmtLabel.text.doubleValue;
	if (otherAmt > tvc.amt1) {
		[self setAmount:otherAmt];
		tvc.amtButton1.selected = NO;
		tvc.amtButton2.selected = NO;
		tvc.amtButton3.selected = NO;
		tvc.amtButton4.selected = NO;
	} else {
		[self setAmount:tvc.amt1];
		tvc.amtButton1.selected = YES;
		tvc.amtButton2.selected = NO;
		tvc.amtButton3.selected = NO;
		tvc.amtButton4.selected = NO;
		tvc.otherAmtLabel.text = @"";
	}
	
	[self.view endEditing:YES];
}

- (void)setAmount:(double)amt {
	amount = amt;
	self.amtLabel.text = [NSString stringWithFormat:@"$%.2f", amt];
}

@end
