
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
	
	donateButtons = @[self.amtButton1,
					  self.amtButton2,
					  self.amtButton3,
					  self.amtButton4];
	areaButtons = @[self.area1Button,
					self.area2Button,
					self.area3Button,
					self.area4Button,
					self.area5Button,
					self.area6Button,
					self.area7Button,
					self.area8Button,
					self.generalButton];
}

- (void)loadContent {
	if (self.infoText)
		self.infoLabel.text = self.infoText;
	self.amtLabel1.text = [NSString stringWithFormat:@"$%d", self.amt1];
	self.amtLabel2.text = [NSString stringWithFormat:@"$%d", self.amt2];
	self.amtLabel3.text = [NSString stringWithFormat:@"$%d", self.amt3];
	self.amtLabel4.text = [NSString stringWithFormat:@"$%d", self.amt4];
	
	self.project1Label.text = [ISOCDataProvider valueForKey:@"sponsorProject1"];
	self.project2Label.text = [ISOCDataProvider valueForKey:@"sponsorProject2"];
	self.project3Label.text = [ISOCDataProvider valueForKey:@"sponsorProject3"];
	self.project4Label.text = [ISOCDataProvider valueForKey:@"sponsorProject4"];
	self.project5Label.text = [ISOCDataProvider valueForKey:@"sponsorProject5"];
	self.project6Label.text = [ISOCDataProvider valueForKey:@"sponsorProject6"];
	self.project7Label.text = [ISOCDataProvider valueForKey:@"sponsorProject7"];
	self.project8Label.text = [ISOCDataProvider valueForKey:@"sponsorProject8"];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self loadContent];
	
	amounts = @[@(self.amt1),
				@(self.amt2),
				@(self.amt3),
				@(self.amt4)];
	projects = @[self.project1Label.text,
				 self.project2Label.text,
				 self.project3Label.text,
				 self.project4Label.text,
				 self.project5Label.text,
				 self.project6Label.text,
				 self.project7Label.text,
				 self.project8Label.text];
	
	[(SponsorProjectViewController*)self.parentViewController setProject:projects[0]];
	
	[SVProgressHUD dismiss];
}

- (IBAction)areaPressed:(id)sender {
	for (unsigned int i = 0; i < areaButtons.count; i++) {
		UIButton *button = [areaButtons objectAtIndex:i];
		if (button == sender) {
			[button setSelected:YES];
			[(SponsorProjectViewController*)self.parentViewController setProject:projects[i]];
		} else {
			[button setSelected:NO];
		}
	}
}

- (IBAction)amountPressed:(id)sender {
	for (unsigned int i = 0; i < donateButtons.count; i++) {
		UIButton *button = [donateButtons objectAtIndex:i];
		if (button == sender) {
			[button setSelected:YES];
			[(SponsorProjectViewController*)self.parentViewController setAmount:[amounts[i] intValue]];
		} else {
			[button setSelected:NO];
		}
	}
}

@end
