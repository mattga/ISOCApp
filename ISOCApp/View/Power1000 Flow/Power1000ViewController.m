//
//  Power1000ViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "Power1000ViewController.h"

@implementation Power1000ViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.sponsorButton.layer.shadowRadius = 3;
	self.sponsorButton.layer.shadowOpacity = .1;
	self.sponsorButton.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
	self.sponsorButton.layer.shadowColor = [UIColor blackColor].CGColor;
	
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

@end
