//
//  EidInfoViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/30/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "EidInfoViewController.h"

@implementation EidInfoViewController


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	self.titleLabel.text = [ISOCDataProvider valueForKey:@"eidTitle"];
	self.dateLabel.text = [ISOCDataProvider valueForKey:@"eidDate"];
	self.locLabel.text = [ISOCDataProvider valueForKey:@"eidLoc"];
	self.prayerTimeLabel.text = [ISOCDataProvider valueForKey:@"eidPrayerTime"];
	self.instructionsLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
								   [ISOCDataProvider valueForKey:@"eidInstruct1"],
								   [ISOCDataProvider valueForKey:@"eidInstruct2"],
								   [ISOCDataProvider valueForKey:@"eidInstruct3"],
								   [ISOCDataProvider valueForKey:@"eidInstruct4"]];
	
	[SVProgressHUD dismiss];
}

@end
