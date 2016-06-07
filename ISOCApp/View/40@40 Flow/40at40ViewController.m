//
//  40at40ViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/18/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "40at40ViewController.h"
#import "SponsorProjectViewController.h"

@interface _0at40ViewController ()

@end

@implementation _0at40ViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.projectButton.layer.shadowRadius = 3;
	self.projectButton.layer.shadowOpacity = .1;
	self.projectButton.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
	self.projectButton.layer.shadowColor = [UIColor blackColor].CGColor;
	
	[ISOCDataProvider fetchStaticValueAsync:@"40x40_amt"
								   callback:^(NSArray *o, NSError *err) {
									   dispatch_async(dispatch_get_main_queue(), ^{
										   [self setSponsorCount:[[o firstObject] valueForKey:@"text"]];
										   [SVProgressHUD dismiss];
									   });
								   }];
}

- (void)setSponsorCount:(NSString*)count {
	NSString *s = [NSString stringWithFormat:@"Current Number of Sponsors: %@", count];
	NSRange range = [s rangeOfString:count];
	NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:s];
	[attrStr addAttribute:NSForegroundColorAttributeName value:kISOCDarkBlue range:range];
	[attrStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17.f] range:range];
	
	self.sponsorCountLabel.attributedText = attrStr;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"sponsorProjectSegue"]) {
		SponsorProjectViewController *pvc = segue.destinationViewController;
		pvc.infoText = @"Please indicate a total sponsorship amount. Each increment of $2,500 represents the number of sponsors you are committing for. You can sponsor $2,500 or more per member in your family, or on behalf of someone who has passed away.";
		pvc.titleText = @"Forty at Forty";
		pvc.donation1 = 2500;
		pvc.donation2 = 5000;
		pvc.donation3 = 7500;
		pvc.donation4 = 10000;
		pvc.ccConfirm = [ISOCDataProvider valueForKey:@"40x40PostCCpayment"];
		pvc.ipConfirm = [ISOCDataProvider valueForKey:@"40x40PostPayInPerson"];
	}
}

@end
