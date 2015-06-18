//
//  SponsorIftarViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/1/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SponsorIftarViewController.h"
#import "RamadanCollectionViewCell.h"

@implementation SponsorIftarViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (NSDateFormatter *)dateFormatter
{
	static NSDateFormatter *dateFormatter;
	if(!dateFormatter){
		dateFormatter = [NSDateFormatter new];
		dateFormatter.dateFormat = @"dd-MM-yyyy";
	}
	
	return dateFormatter;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedCalendar"]) {
		cvc = segue.destinationViewController;
	} else if ([segue.identifier isEqualToString:@"iftarDetailSegue"]) {
		iftarDetailVC = segue.destinationViewController;
		RamadanCollectionViewCell* cell = (RamadanCollectionViewCell*)sender;
		iftarDetailVC.day = cell.index;
		NSString *key = [NSString stringWithFormat:@"iftarSponsors%d", cell.index-3];
		iftarDetailVC.numSponsors = [[[cvc sponsoredIftars] valueForKey:key] intValue];
		iftarDetailVC.navigationItem.title = [NSString stringWithFormat:@"Ramadan %@, %@", cell.dayLabel.text, cell.dateLabel.text];
	}
}

@end
