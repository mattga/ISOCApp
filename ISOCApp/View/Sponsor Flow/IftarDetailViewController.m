
//
//  IftarDetailViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/11/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "IftarDetailViewController.h"
#import "SponsorTableViewCell.h"

@implementation IftarDetailViewController
@synthesize day, numSponsors, amount;

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	int rDay = day - 3;
	self.menuLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",
						   [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line1", rDay]],
						   [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line2", rDay]],
						   [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line3", rDay]],
						   [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line4", rDay]]];
	self.timeLabel.text = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"fastEnds%d", rDay]];
	
	[SVProgressHUD dismiss];
}

- (void)addAmount:(double)add {
	amount += add;
	self.amountLabel.text = [NSString stringWithFormat:@"%.2f", amount];
	
	if (amount == 0.)
		self.confirmButton.enabled = NO;
	else
		self.confirmButton.enabled = YES;
}

- (IBAction)confirmPressed:(id)sender {
	NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
	url = [NSString stringWithFormat:@"%@?amt=%.2f", url, amount];
	url = [NSString stringWithFormat:@"%@&dt=iftar", url];
	url = [NSString stringWithFormat:@"%@&not=day:%d", url, day-3];
	url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	NSLog(@"Opening url: %@", url);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (day % 7 == 6)
		return 2;
	return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SponsorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sponsorCell"];
	cell.iftarDetailVC = self;
	
	if (day % 7 == 6) {
		if (indexPath.row == 0) {
			cell.label.text = @"$300 - Iftar";
			cell.type = Iftar;
		} else {
			cell.iconImageView.image = [UIImage imageNamed:@"ico_supplies"];
			cell.label.text = @"$600 - Supplies & Cleaning";
			cell.type = SuppliesCleaning;
		}
	} else {
		if (indexPath.row < 5) {
			cell.label.text = @"$600 - 100 People Dinner";
			cell.type = Dinner;
		} else if (indexPath.row == 5) {
			cell.label.text = @"$600 - Iftar & Children's Meals";
			cell.type = IftarChildrenMeals;
		} else {
			cell.iconImageView.image = [UIImage imageNamed:@"ico_supplies"];
			cell.label.text = @"$600 - Supplies & Cleaning";
			cell.type = SuppliesCleaning;
		}
	}
	
	if (indexPath.row < numSponsors) {
		cell.button.enabled = NO;
		cell.contentView.alpha = .5;
	}
	
	return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	self.amountLabel.text = [NSString stringWithFormat:@"%.2f", amount];
}

@end
