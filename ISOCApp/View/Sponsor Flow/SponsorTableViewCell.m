//
//  IftarTableViewCell.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/11/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorTableViewCell.h"
#import "IftarDetailViewController.h"

@implementation SponsorTableViewCell

- (IBAction)buttonPressed:(id)sender {
	self.button.selected = !self.button.selected;
	
	double add;
	if (self.button.selected) {
		add = (self.type == Iftar ? 300. : 600.);
	} else {
		add = (self.type == Iftar ? -300. : -600.);
	}
	[(IftarDetailViewController*)self.iftarDetailVC addAmount:add];
}

@end
