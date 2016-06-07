//
//  BanquetTicketsViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "BanquetTicketsViewController.h"
#import "MGAlertUtility.h"
#import "CheckoutViewController.h"

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
	indiv = self.individualField.text.intValue;
	table = self.tableField.text.intValue;
	babysit = self.babysitField.text.intValue;
	amount = indiv*60+table*600+babysit*30;
	self.amountLabel.text = [NSString stringWithFormat:@"$%d", amount];

	if (amount == 0.)
		self.confirmButton.enabled = NO;
	else
		self.confirmButton.enabled = YES;
	
	[self.view endEditing:YES];
}

- (IBAction)confirmPressed:(id)sender {
	NSDictionary *params = @{@"amt"	: [NSString stringWithFormat:@"%d", amount],
							 @"dt"	: @"Banquet Tickets",
							 @"not"	: [NSString stringWithFormat:@"individual:%d,table:%d,babysitting:%d",indiv,table,babysit]};
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	CheckoutViewController *vc = [sb instantiateViewControllerWithIdentifier:@"inPersonVC"];
	vc.ccConfirm = [ISOCDataProvider valueForKey:@"banquetPostCCpayment"];
	vc.ipConfirm = [ISOCDataProvider valueForKey:@"banquetPostPayInPerson"];
	vc.params = params;
	
	[self.navigationController pushViewController:vc animated:YES];
	
//	void (^onlineHandler)(UIAlertAction *action) = ^(UIAlertAction *action) {
//		NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
//		url = [NSString stringWithFormat:@"%@?amt=%d", url, amount];
//		url = [NSString stringWithFormat:@"%@&dt=BanquetTickets", url];
//		url = [NSString stringWithFormat:@"%@&not=individual:%d,table:%d,babysitting:%D", url, indiv,table,babysit];
//		url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//		
//		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//		NSLog(@"Opening url: %@", url);
//	};
//	
//	void (^personHandler)(UIAlertAction *action) = ^(UIAlertAction *action) {
//	};
//	
//	[MGAlertUtility showCancelActionSheet:@"Checkout"
//								  message:@"How would you like to make your purchase?"
//								  actions:@{@"Pay Online" : onlineHandler,
//											@"Pay In Person" : personHandler}];
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