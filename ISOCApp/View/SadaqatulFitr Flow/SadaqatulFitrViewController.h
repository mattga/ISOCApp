//
//  SadaqatulFitrViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 5/30/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface SadaqatulFitrViewController : DetailViewController {
	double amount;
}

@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (weak, nonatomic) IBOutlet UITextField *numPeopleTextField;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

- (IBAction)confirmPressed:(id)sender;

@end
