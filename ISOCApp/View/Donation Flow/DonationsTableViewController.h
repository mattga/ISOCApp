//
//  DonationsTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/5/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonationsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *masjidField;
@property (weak, nonatomic) IBOutlet UITextField *schoolField;
@property (weak, nonatomic) IBOutlet UITextField *socialField;
@property (weak, nonatomic) IBOutlet UITextField *funeralField;

@end
