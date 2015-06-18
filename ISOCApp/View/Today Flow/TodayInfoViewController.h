//
//  TodayInfoViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/10/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface TodayInfoViewController : DetailViewController {
	NSCalendar *calendar;
	int ramadanStart, ramadanOffset;
	NSDate *startDate, *currentDate, *endDate;
}

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *khutbahLabel;
@property (weak, nonatomic) IBOutlet UILabel *beginFastLabel;
@property (weak, nonatomic) IBOutlet UILabel *endFastLabel;
@property (weak, nonatomic) IBOutlet UILabel *menuLabel;
@property (weak, nonatomic) IBOutlet UILabel *tarawihLabel;
@property (weak, nonatomic) IBOutlet UILabel *kathiraLabel;
@property (weak, nonatomic) IBOutlet UILabel *tafseerLabel;
@property (weak, nonatomic) IBOutlet UILabel *specialEventsLabel;

@property (weak, nonatomic) IBOutlet UIButton *timetableButton;
@property (weak, nonatomic) IBOutlet UIButton *programsButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

- (IBAction)timetablesPressed:(id)sender;
- (IBAction)programsPressed:(id)sender;
- (IBAction)menuPressed:(id)sender;
- (IBAction)prevPressed:(id)sender;
- (IBAction)nextPressed:(id)sender;

@end
