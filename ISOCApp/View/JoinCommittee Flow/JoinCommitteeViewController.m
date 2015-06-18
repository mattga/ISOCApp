//
//  JoinCommitteeViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/1/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "JoinCommitteeViewController.h"
#import "SubmitInfoViewController.h"
#import "SubmitInfoTableViewController.h"
#import "CommitteeTableViewCell.h"
#import "OtherChoicesTableViewCell.h"
#import "MGAlertUtility.h"

@implementation JoinCommitteeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	titles = [ISOCGlobals getVar].titles;
	descriptions = [ISOCGlobals getVar].descriptions;
	selCommittees = [@[] mutableCopy];
	
	self.tableView.estimatedRowHeight = 120.;
	self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[SVProgressHUD dismiss];
}

- (void)selectPressed:(id)sender {
	UIButton *button = sender;
	button.selected = !button.selected;
	
	NSString *committee;
	if (button.tag >= 0) {
		committee = [titles objectAtIndex:button.tag];
		committee = [NSString stringWithFormat:@"%lu-%@", button.tag, committee];
	} else if (button.tag == -1) {
		committee = @"newsletter/allerts";
	} else if (button.tag == -2) {
		committee = @"isoc member info";
	}
	
	if (button.selected) {
		[selCommittees addObject:committee];
	} else {
		[selCommittees removeObject:committee];
	}
	
	if (selCommittees.count > 0) {
		self.continueButton.enabled = YES;
	} else {
		self.continueButton.enabled = NO;
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"submitInfoSegue"]) {
		[(SubmitInfoViewController*)segue.destinationViewController setSelCommittees:selCommittees];
	}
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = nil;
	
	if (indexPath.row < 10) {
		NSString *title = titles[indexPath.row];
		NSString *desc = descriptions[indexPath.row];
		NSString *obj = [NSString stringWithFormat:@"%lu%@", indexPath.row, title];
		cell = [tableView dequeueReusableCellWithIdentifier:@"committeeCell"];
		[(CommitteeTableViewCell*)cell titleLable].text = (title == nil ? @"   -" : title);
		[(CommitteeTableViewCell*)cell descLabel].text = (desc == nil ? @"   -" : desc);
		[(CommitteeTableViewCell*)cell selectButton].tag = indexPath.row;
		[(CommitteeTableViewCell*)cell selectButton].selected = [selCommittees indexOfObject:obj] != NSNotFound;
		[[(CommitteeTableViewCell*)cell selectButton] addTarget:self
														 action:@selector(selectPressed:)
											   forControlEvents:UIControlEventTouchUpInside];
		
	} else {
		cell = [tableView dequeueReusableCellWithIdentifier:@"othersCell"];
		[[(OtherChoicesTableViewCell*)cell otherChoice1Button] addTarget:self
																  action:@selector(selectPressed:)
											   forControlEvents:UIControlEventTouchUpInside];
		[[(OtherChoicesTableViewCell*)cell otherChoice2Button] addTarget:self
																  action:@selector(selectPressed:)
											   forControlEvents:UIControlEventTouchUpInside];
	}
	
	return cell;
}

@end
