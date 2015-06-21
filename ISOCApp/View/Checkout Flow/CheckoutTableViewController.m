
//
//  InPersonTableViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/21/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "CheckoutTableViewController.h"
#import "MGAlertUtility.h"
#import "ISOCGlobals.h"

@interface CheckoutTableViewController ()

@end

@implementation CheckoutTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.onlineButton.layer.shadowRadius = 3;
	self.onlineButton.layer.shadowOpacity = .1;
	self.onlineButton.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
	self.onlineButton.layer.shadowColor = [UIColor blackColor].CGColor;
	
	self.inPersonButton.layer.shadowRadius = 3;
	self.inPersonButton.layer.shadowOpacity = .1;
	self.inPersonButton.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
	self.inPersonButton.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (BOOL)validateInput {
	if ([self.nameField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.addressField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.cityField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.stateField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.zipField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.cellField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.emailField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	if ([self.emailField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	} else {
		NSString *pattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
		NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
		NSUInteger regExMatches = [regEx numberOfMatchesInString:self.emailField.text options:0 range:NSMakeRange(0, [self.emailField.text length])];
		if (regExMatches == 0) {
			[SVProgressHUD showErrorWithStatus:@"Invalid Email"];
			return NO;
		}
	}
	
	return YES;
}

- (IBAction)onlinePressed:(id)sender {
	if ([self validateInput]) {
		[self.view endEditing:YES];
		
		__block BOOL first = YES;
		__block NSString *url = [ISOCDataProvider valueForKey:@"donationPageURL"];
		NSDictionary *params2 = @{@"na" : self.nameField.text,
								  @"ad1" : self.addressField.text,
								  @"ci" : self.cityField.text,
								  @"st" : self.stateField.text,
								  @"zc" : self.zipField.text,
								  @"mo" : self.cellField.text,
								  @"em" : self.emailField.text};
		[params2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
			if (first) {
				url = [NSString stringWithFormat:@"%@?%@=$@", key, obj];
				first = NO;
			} else {
				url = [NSString stringWithFormat:@"%@&%@=$@", key, obj];
			}
		}];
		[self.params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
			url = [NSString stringWithFormat:@"%@&%@=$@", key, obj];
		}];
		
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
		NSLog(@"Opening URL %@", url);
	}
}

- (IBAction)inPersonPressed:(id)sender {
	if ([self validateInput]) {
		[self.view endEditing:YES];
		[SVProgressHUD showWithStatus:@"Submitting..."];
		
		NSMutableDictionary *params2 = [@{@"na" : self.nameField.text,
										  @"addr" : self.addressField.text,
										  @"ci" : self.cityField.text,
										  @"st" : self.stateField.text,
										  @"zc" : self.zipField.text,
										  @"mo" : self.cellField.text,
										  @"em" : self.emailField.text} mutableCopy];
		[params2 addEntriesFromDictionary:self.params];
		
		[ISOCDataProvider putInPersonPayment:params2
									callback:^(id o, NSError *err) {
										dispatch_async(dispatch_get_main_queue(), ^{
											[MGAlertUtility showOKAlertWithMessage:self.ipConfirm
																			 title:@"Success"];
											[self.parentViewController.navigationController popViewControllerAnimated:YES];
											[SVProgressHUD dismiss];
										});
									}];
	}
}

@end
