
//
//  CalendarCollectionViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/7/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "CalendarCollectionViewController.h"
#import "RamadanCollectionViewCell.h"
#import "IftarDetailViewController.h"

@implementation CalendarCollectionViewController
@synthesize sponsoredIftars;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.collectionView.contentOffset = CGPointMake(0., 0.);
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitYear) fromDate:[NSDate date]];
	[dateComponents setDay:17];
	[dateComponents setMonth:5];
	[dateComponents setYear:2015];
	calendarStartDate = [calendar dateFromComponents:dateComponents];
	
	[dateComponents setDay:14];
	[dateComponents setMonth:5];
	[dateComponents setYear:2015];
	ramadanStartDate = [calendar dateFromComponents:dateComponents];
	
	sponsoredIftars = [@{} mutableCopy];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	self.collectionView.userInteractionEnabled = NO;
	for (int i = 1; i < 30; i++) {
		__block int day = i;
		NSString *key = [NSString stringWithFormat:@"iftarSponsors%d", day];
		[ISOCDataProvider fetchStaticValueAsync:key callback:^(NSArray *o, NSError *err) {
			int numSponsors = [[o.firstObject valueForKey:@"text"] intValue];
			[sponsoredIftars setValue:@(numSponsors) forKey:key];
			dispatch_async(dispatch_get_main_queue(), ^{
				if (day > 28) {
					self.collectionView.userInteractionEnabled = YES;
					[SVProgressHUD dismiss];
				}
				
				NSIndexPath *iPath = [NSIndexPath indexPathForItem:day+3 inSection:0];
				RamadanCollectionViewCell *_cell = (RamadanCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:iPath];
				NSLog(@"Day %d: Sat? %d", day, day+3 % 7 == 6);
				if (day % 7 == 3) {
					[_cell sponsorsLabel].text = [NSString stringWithFormat:@"%d/2", numSponsors];
					if (numSponsors >= 2) {
						_cell.alpha = .5;
					}
				} else {
					[_cell sponsorsLabel].text = [NSString stringWithFormat:@"%d/7", numSponsors];
					if (numSponsors >= 7) {
						_cell.alpha = .5;
					}
				}
			});
		}];
	}
}

#pragma mark - Collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 35;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	UICollectionViewCell *cell = nil;
	int offset = (int)indexPath.item;
	int day = 14 + offset;
	int numSponsor = [[sponsoredIftars valueForKey:[NSString stringWithFormat:@"%d", day-17]] intValue];
	
	NSString *date = @"";
	if (day < 31) {
		date = [NSString stringWithFormat:@"June %d", day];
	} else {
		date = [NSString stringWithFormat:@"July %d", day%30];
	}
	
	if (offset < 4 || offset > 32) {
		cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"normalCell" forIndexPath:indexPath];
		[[[cell subviews].firstObject subviews].firstObject setText:date];
	} else {
		cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ramadanCell" forIndexPath:indexPath];
		[(RamadanCollectionViewCell*)cell setIndex:offset];
		[(RamadanCollectionViewCell*)cell dateLabel].text = date;
		[(RamadanCollectionViewCell*)cell dayLabel].text = [NSString stringWithFormat:@"%d", day-17];
		if (offset % 7 == 6) {
			[(RamadanCollectionViewCell*)cell sponsorsLabel].text = [NSString stringWithFormat:@"%d/2", numSponsor];
			if (numSponsor >= 2) {
				cell.alpha = .5;
			}
		} else {
			[(RamadanCollectionViewCell*)cell sponsorsLabel].text = [NSString stringWithFormat:@"%d/7", numSponsor];
			if (numSponsor >= 7) {
				cell.alpha = .5;
			}
		}
	}
	
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat width = collectionView.frame.size.width;
	CGFloat side = floor(width / 7.) - 3.;
	NSLog(@"%f", width);
	return CGSizeMake(side, side);
}

#pragma mark - Collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.item >= 4 && indexPath.item <= 32) {
		UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
		[self.parentViewController performSegueWithIdentifier:@"iftarDetailSegue" sender:cell];
	}
}

@end



/*		NSString *key = [NSString stringWithFormat:@"iftarSponsors%d", day-17];
 [ISOCDataProvider fetchStaticValue:key callback:^(NSArray *o, NSError *err) {
 int numSponsor = [[o.firstObject valueForKey:@"text"] intValue];
 [sponsoredIftars setValue:@(numSponsor) forKey:key];
 dispatch_async(dispatch_get_main_queue(), ^{
 NSIndexPath *iPath = [NSIndexPath indexPathForItem:offset inSection:0];
 RamadanCollectionViewCell *_cell = (RamadanCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:iPath];
 if (offset % 7 == 6) {
 [_cell sponsorsLabel].text = [NSString stringWithFormat:@"%d/2", numSponsor];
 if (numSponsor >= 2) {
 cell.alpha = .5;
 }
 } else {
 [_cell sponsorsLabel].text = [NSString stringWithFormat:@"%d/7", numSponsor];
 if (numSponsor >= 7) {
 cell.alpha = .5;
 }
 }
 });
 }];*/
