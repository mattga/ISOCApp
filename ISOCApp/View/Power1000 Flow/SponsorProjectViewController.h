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

@property (strong, nonatomic) NSString *project;
@property (strong, nonatomic) NSString *infoText;
@property (nonatomic) int donation1;
@property (nonatomic) int donation2;
@property (nonatomic) int donation3;
@property (nonatomic) int donation4;

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UILabel *amtLabel;

- (IBAction)continuePressed:(id)sender;

- (void)setAmount:(int)amt;

@end
