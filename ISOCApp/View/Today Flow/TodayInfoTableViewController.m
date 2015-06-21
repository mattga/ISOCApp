//
//  TodayInfoTableViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/20/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "TodayInfoTableViewController.h"
#import "Constants.h"
#import "ISOCDataProvider.h"

@interface TodayInfoTableViewController ()

@end

@implementation TodayInfoTableViewController

- (void)setDataForDay:(int)day {
	[self.tableView beginUpdates];
	
	self.beginFastLabel.text = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"fastBegins%d", day]];
	self.endFastLabel.text = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"fastEnds%d", day]];
	NSString *menu1 = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line1", day]];
	NSString *menu2 = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line2", day]];
	NSString *menu3 = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line3", day]];
	NSString *menu4 = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"menu%d_line4", day]];
	self.menuLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", menu1, menu2, menu3, menu4];
	self.tarawihLabel.text = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"tarawihStart%d", day]];
	self.kathiraLabel.text = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"khatiraGiver%d", day]];
	self.tafseerLabel.text = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"tafseerGiver%d", day]];
	NSString *event1 = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"specialEvents1_%d", day]];
	NSString *event2 = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"specialEvents2_%d", day]];
	self.specialEventsLabel.text = [NSString stringWithFormat:@"%@\n%@", event1, event2];
	if (day % 7 == 2) {
		self.khutbahLabel.hidden = NO;
		self.khutbahGiverLabel.hidden = NO;
		NSString *kg = [ISOCDataProvider valueForKey:[NSString stringWithFormat:@"khutbahGiver%d", day/7+1]];
		self.khutbahGiverLabel.text = kg;
	} else {
		self.khutbahLabel.hidden = YES;
		self.khutbahGiverLabel.hidden = YES;
	}
	
	[self.tableView endUpdates];
}

@end
