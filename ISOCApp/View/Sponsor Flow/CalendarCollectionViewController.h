//
//  CalendarCollectionViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/7/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RAMADAN_DAY		18
#define RAMADAN_MONTH	5
#define RAMADAN_LEN		29

@interface CalendarCollectionViewController : UICollectionViewController {
	NSDate *calendarStartDate, *ramadanStartDate;
}

@property(strong, nonatomic) NSMutableDictionary *sponsoredIftars;;

@end
