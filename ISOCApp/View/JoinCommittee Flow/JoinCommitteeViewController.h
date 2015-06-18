//
//  JoinCommitteeViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/1/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface JoinCommitteeViewController : DetailViewController <UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *titles, *descriptions;
	NSMutableArray *selCommittees;
}

@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
