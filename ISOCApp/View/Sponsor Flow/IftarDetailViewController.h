//
//  IftarDetailViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/11/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface IftarDetailViewController : DetailViewController <UITableViewDataSource, UITableViewDelegate> {
	double amount;
}

@property (nonatomic) int day;
@property (nonatomic) int numSponsors;
@property (nonatomic) double amount;
@property (weak, nonatomic) IBOutlet UILabel *menuLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

- (void)addAmount:(double)add;

- (IBAction)confirmPressed:(id)sender;

@end
