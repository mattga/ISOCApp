//
//  SponsorProjectViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorProjectViewController.h"

@implementation SponsorProjectViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedSponsor"])
		tvc = segue.destinationViewController;
}

- (IBAction)continuePressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"donationPageURL"]]];
}

@end
