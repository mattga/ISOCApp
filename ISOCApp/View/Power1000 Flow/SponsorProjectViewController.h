//
//  SponsorProjectViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "SponsorProjectTableViewController.h"

@interface SponsorProjectViewController : DetailViewController {
	SponsorProjectTableViewController *tvc;
	double amount;
}

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

- (IBAction)continuePressed:(id)sender;

@end
