//
//  SponsorIftarViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/1/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "CalendarCollectionViewController.h"
#import "IftarDetailViewController.h"

@interface SponsorIftarViewController : DetailViewController {
	CalendarCollectionViewController *cvc;
	IftarDetailViewController *iftarDetailVC;
}

@end
