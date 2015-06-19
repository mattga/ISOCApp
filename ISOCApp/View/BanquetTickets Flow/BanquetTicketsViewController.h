//
//  BanquetTicketsViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"

@interface BanquetTicketsViewController : DetailViewController <UITextFieldDelegate> {
	UITextField *activeField;
	int amount, indiv, table, babysit;
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UITextField *individualField;
@property (weak, nonatomic) IBOutlet UITextField *tableField;
@property (weak, nonatomic) IBOutlet UITextField *babysitField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

- (IBAction)confirmPressed:(id)sender;

- (void)dismissKeyboard:(id)sender;

@end
