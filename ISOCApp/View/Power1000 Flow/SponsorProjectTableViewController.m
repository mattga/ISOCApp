
//
//  SponsorProjectTableViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorProjectTableViewController.h"
#import "SponsorProjectViewController.h"

@implementation SponsorProjectTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self loadContent];
	
	areaButtons = @[self.area1Button,
					self.area2Button,
					self.area3Button,
					self.area4Button,
					self.area5Button];
}

- (void)loadContent {
	[ISOCDataProvider fetchStaticValue:@"sponsorProject1"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  self.project1Label.text = [[o firstObject] valueForKey:@"text"];
								  });
							  }];
	[ISOCDataProvider fetchStaticValue:@"sponsorProject2"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  self.project2Label.text = [[o firstObject] valueForKey:@"text"];
								  });
							  }];
	[ISOCDataProvider fetchStaticValue:@"sponsorProject3"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  self.project3Label.text = [[o firstObject] valueForKey:@"text"];
								  });
							  }];
	[ISOCDataProvider fetchStaticValue:@"sponsorProject4"
							  callback:^(NSArray *o, NSError *err) {
								  dispatch_async(dispatch_get_main_queue(), ^{
									  self.project4Label.text = [[o firstObject] valueForKey:@"text"];
									  [SVProgressHUD dismiss];
								  });
							  }];
}

- (IBAction)areaPressed:(id)sender {
	for (unsigned int i = 0; i < areaButtons.count; i++) {
		UIButton *button = [areaButtons objectAtIndex:i];
		if (button == sender) {
			[button setSelected:YES];
		} else {
			[button setSelected:NO];
		}
	}
}

@end
