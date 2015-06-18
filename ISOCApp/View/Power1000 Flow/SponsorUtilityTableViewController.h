//
//  SponsorUtilityTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/7/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseTableViewController.h"

@interface SponsorUtilityTableViewController : BaseTableViewController

@property (weak, nonatomic) IBOutlet UILabel *gasAmtLabel;
@property (weak, nonatomic) IBOutlet UILabel *waterAmtLabel;
@property (weak, nonatomic) IBOutlet UILabel *trashAmtLabel;
@property (weak, nonatomic) IBOutlet UILabel *elecAmtLabel;

@property (weak, nonatomic) IBOutlet UITextField *gasField;
@property (weak, nonatomic) IBOutlet UITextField *waterField;
@property (weak, nonatomic) IBOutlet UITextField *trashField;
@property (weak, nonatomic) IBOutlet UITextField *electricityField;

@end
