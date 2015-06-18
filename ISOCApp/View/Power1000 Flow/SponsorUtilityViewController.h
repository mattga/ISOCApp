//
//  SponsorUtilityViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/7/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "SponsorUtilityTableViewController.h"

@interface SponsorUtilityViewController : DetailViewController {
	SponsorUtilityTableViewController *tvc;
	int amount, gasAmt, waterAmt, trashAmt, elecAmt;
}

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

- (IBAction)continuePressed:(id)sender;

@end
