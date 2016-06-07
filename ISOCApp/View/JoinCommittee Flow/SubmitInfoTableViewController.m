//
//  SubmitInfoViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/12/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SubmitInfoTableViewController.h"
#import "MGAlertUtility.h"
#import "SubmitInfoViewController.h"

@implementation SubmitInfoTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.submitButton.layer.shadowRadius = 3;
	self.submitButton.layer.shadowOpacity = .1;
	self.submitButton.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
	self.submitButton.layer.shadowColor = [UIColor blackColor].CGColor;
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
	if ([self.zipcodeField.text isEqualToString:@""]) {
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
	if ([self.ageField.text isEqualToString:@""]) {
		[SVProgressHUD showErrorWithStatus:@"Incomplete Form"];
		return NO;
	}
	
	return YES;
}

- (IBAction)submitPressed:(id)sender {
	if ([self validateInput]) {
		[self.view endEditing:YES];
		[SVProgressHUD showWithStatus:@"Submitting..."];
		NSArray *committees = [(SubmitInfoViewController*)self.parentViewController selCommittees];
		for (NSString *c in committees) {
			NSDictionary *params = @{@"committeeName" : c,
									 @"name" : self.nameField.text,
									 @"address" : self.addressField.text,
									 @"city" : self.cityField.text,
									 @"state" : self.stateField.text,
									 @"zipcode" : self.zipcodeField.text,
									 @"mobile" : self.cellField.text,
									 @"email" : self.emailField.text,
									 @"age" : self.ageField.text,
									 @"gender" : (self.genderSwitch.selectedSegmentIndex == 0 ? @"M" : @"F")};
			
			[ISOCDataProvider putJoinCommittee:params callback:^(id o, NSError *err) {
				if (err) {
					[MGAlertUtility showErrorMessage:err onView:self.parentViewController];
				}
			}];
		}
		[SVProgressHUD dismiss];
		[MGAlertUtility showOKAlertWithMessage:@"Thank you for joining our team! ISOC will be contacting you soon!"
										 title:@"Success"
										onView:self
									  okAction:^(UIAlertAction *action) {
										  [self.parentViewController.navigationController popToRootViewControllerAnimated:YES];
									  }];
	}
}

@end
