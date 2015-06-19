//
//  SponsorProjectViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorProjectViewController.h"

@implementation SponsorProjectViewController
@synthesize donation1, donation2, donation3, donation4, infoText;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedSponsor"]) {
		tvc = segue.destinationViewController;
		if (infoText)
			tvc.infoText = infoText;
		tvc.amt1 = donation1;
		tvc.amt2 = donation2;
		tvc.amt3 = donation3;
		tvc.amt4 = donation4;
		[self setAmount:donation1];
	}
}

- (IBAction)continuePressed:(id)sender {
	NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
	url = [NSString stringWithFormat:@"%@?amount=%.2f", url, amount];
	url = [NSString stringWithFormat:@"%@&project=%@", url, self.project];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	NSLog(@"Opening url: %@", url);
}

- (void)setAmount:(int)amt {
	amount = amt;
	self.amtLabel.text = [NSString stringWithFormat:@"$%d", amt];
}

@end
