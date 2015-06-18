//
//  BanquetTicketsViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "BanquetTicketsViewController.h"

@implementation BanquetTicketsViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.scrollView.contentSize = self.contentView.frame.size;
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
	[self.scrollView addGestureRecognizer:tapGesture];
	
	[self registerForKeyboardNotifications];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSString *title = [NSString stringWithFormat:@"%@\n%@",
					   [ISOCDataProvider valueForKey:@"banquetTitle"],
					   [ISOCDataProvider valueForKey:@"banquetDesc"]];
	NSString *info = [ISOCDataProvider valueForKey:@"banquetLoc"];
	for (int i = 0; i < 4; i++) {
		NSString *key = [NSString stringWithFormat:@"banquetSched%d", i+1];
		NSString *sched = [ISOCDataProvider valueForKey:key];
		if (![sched isEqualToString:@""])
			info = [NSString stringWithFormat:@"%@\n%@", info, sched];
	}
	
	self.titleLabel.text = title;
	self.dateLabel.text = [ISOCDataProvider valueForKey:@"banquetDate"];
	self.infoLabel.text = info;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[SVProgressHUD dismiss];
}

- (void)dismissKeyboard:(id)sender {
	int indiv = self.individualLabel.text.intValue;
	int table = self.tableLabel.text.intValue;
	int babysit = self.babysitLabel.text.intValue;
	amount = indiv*60+table*600+babysit*30;
	self.amountLabel.text = [NSString stringWithFormat:@"$%d", amount];

	if (amount == 0.)
		self.confirmButton.enabled = NO;
	else
		self.confirmButton.enabled = YES;
	
	[self.view endEditing:YES];
}

- (IBAction)confirmPressed:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[ISOCDataProvider valueForKey:@"donationPageURL"]]];
}

- (void)registerForKeyboardNotifications
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasShown:)
												 name:UIKeyboardDidShowNotification object:nil];
 
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillBeHidden:)
												 name:UIKeyboardWillHideNotification
											   object:nil];
 
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
	NSDictionary* info = [aNotification userInfo];
	CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
 
	UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
	self.scrollView.contentInset = contentInsets;
	self.scrollView.scrollIndicatorInsets = contentInsets;
 
	// If active text field is hidden by keyboard, scroll it so it's visible
	// Your app might not need or want this behavior.
	CGRect aRect = self.view.frame;
	aRect.size.height -= kbSize.height;
	if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
		[self.scrollView scrollRectToVisible:activeField.frame animated:YES];
	}
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
	UIEdgeInsets contentInsets = UIEdgeInsetsZero;
	self.scrollView.contentInset = contentInsets;
	self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	activeField = nil;
}

@end