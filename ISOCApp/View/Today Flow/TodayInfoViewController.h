//
//  TodayInfoViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/10/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "TodayInfoTableViewController.h"

@interface TodayInfoViewController : DetailViewController {
	NSCalendar *calendar;
	int ramadanStart, ramadanOffset;
	NSDate *startDate, *currentDate, *endDate;
	TodayInfoTableViewController *tvc;
}

@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIButton *timetableButton;
@property (weak, nonatomic) IBOutlet UIButton *programsButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

- (IBAction)timetablesPressed:(id)sender;
- (IBAction)programsPressed:(id)sender;
- (IBAction)menuPressed:(id)sender;
- (IBAction)prevPressed:(id)sender;
- (IBAction)nextPressed:(id)sender;

@end
