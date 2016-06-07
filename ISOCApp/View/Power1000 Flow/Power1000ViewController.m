//
//  Power1000ViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "Power1000ViewController.h"
#import "SponsorProjectViewController.h"

@implementation Power1000ViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.projectButton.layer.shadowRadius = 3;
	self.projectButton.layer.shadowOpacity = .1;
	self.projectButton.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
	self.projectButton.layer.shadowColor = [UIColor blackColor].CGColor;
	
	[ISOCDataProvider fetchStaticValueAsync:@"pow1kCurSponsors"
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
		pvc.titleText = @"Power of 1000";
		pvc.donation1 = 100;
		pvc.donation2 = 200;
		pvc.donation3 = 300;
		pvc.donation4 = 400;
		pvc.ccConfirm = [ISOCDataProvider valueForKey:@"pow1kPostCCpayment"];
		pvc.ipConfirm = [ISOCDataProvider valueForKey:@"pow1kPostPayInPerson"];
	}
}

@end
