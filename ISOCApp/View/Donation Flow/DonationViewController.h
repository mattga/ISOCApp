//
//  DonationViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/5/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "DonationsTableViewController.h"

@interface DonationViewController : DetailViewController {
	DonationsTableViewController *donationTVC;
	NSString *ccConfirm, *personConfirm;
	double amount, masjidAmt, ocsAmt, socialAmt, funeralAmt;
}

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

- (void)dismissKeyboard:(id)sender;
- (IBAction)confirmPressed:(id)sender;

@end
