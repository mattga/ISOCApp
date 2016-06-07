//
//  TodayInfoTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/20/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayInfoTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *khutbahLabel;
@property (weak, nonatomic) IBOutlet UILabel *khutbahGiverLabel;
@property (weak, nonatomic) IBOutlet UILabel *beginFastLabel;
@property (weak, nonatomic) IBOutlet UILabel *endFastLabel;
@property (weak, nonatomic) IBOutlet UILabel *menuLabel;
@property (weak, nonatomic) IBOutlet UILabel *tarawihLabel;
@property (weak, nonatomic) IBOutlet UILabel *kathiraLabel;
@property (weak, nonatomic) IBOutlet UILabel *specialEventsLabel;

- (void)setDataForDay:(int)day;

@end
