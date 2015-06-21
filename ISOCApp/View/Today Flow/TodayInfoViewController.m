
//
//  TodayInfoViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/10/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "TodayInfoViewController.h"
#import "ISOCDataProvider.h"

@implementation TodayInfoViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	ramadanStart = 18;
	currentDate = [NSDate date];
	
	startDate = [NSDate date];
	endDate = [NSDate date];
	calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:startDate];
	components1.month = 6;
	components1.day = 18;
	components1.year = 2015;
	startDate = [calendar dateFromComponents:components1];
	NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:endDate];
	components2.month = 7;
	components2.day = 16;
	components2.year = 2015;
	endDate = [calendar dateFromComponents:components2];
	
	if ([startDate earlierDate:currentDate] == currentDate) {
		currentDate = startDate;
		self.prevButton.enabled = NO;
	}
	if ([endDate laterDate:currentDate] == currentDate) {
		currentDate = endDate;
		self.nextButton.enabled = NO;
	}
	
	[ISOCDataProvider fetchMenuAndEvents];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self loadDataForDay:currentDate];
	
	[SVProgressHUD dismiss];
}

- (void) loadDataForDay:(NSDate*)date {
	NSDateFormatter* df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"EEEE MMM d"];
	
	ramadanOffset = [date timeIntervalSinceDate:startDate] / (60*60*24);
	int day = (ramadanOffset < 0 ? 1 : ramadanOffset+1);
	self.dateLabel.text = [NSString stringWithFormat:@"%@ (Day %d)", [df stringFromDate:date], day];

	[tvc setDataForDay:day];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedTable"]) {
		tvc = segue.destinationViewController;
	}
}

- (IBAction)timetablesPressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"timetableURL"]]];
}

- (IBAction)programsPressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"programsURL"]]];
}

- (IBAction)menuPressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"menuURL"]]];
}

- (IBAction)prevPressed:(id)sender {
	NSDate *newDate = [currentDate dateByAddingTimeInterval:-60 * 60 * 24];
	NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:newDate];
	currentDate = [calendar dateFromComponents:components];
	
	if ([currentDate laterDate:startDate] == startDate)
		self.prevButton.enabled = NO;
	if ([currentDate laterDate:endDate] == endDate)
		self.nextButton.enabled = YES;
	
	[self loadDataForDay:currentDate];
}

- (IBAction)nextPressed:(id)sender {
	NSDate *newDate = [currentDate dateByAddingTimeInterval:60 * 60 * 24];
	NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:newDate];
	currentDate = [calendar dateFromComponents:components];
	
	if ([currentDate earlierDate:startDate] == startDate)
		self.prevButton.enabled = YES;
	if ([currentDate earlierDate:endDate] == endDate)
		self.nextButton.enabled = NO;
	
	[self loadDataForDay:currentDate];
}

@end
