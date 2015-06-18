//
//  BaseViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/27/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard:)];
	doneButton.tintColor = kISOCWhite;
	
	UIToolbar* toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
	toolBar.barStyle = UIBarStyleBlackOpaque;
	toolBar.backgroundColor = kISOCGreen;
	toolBar.barTintColor = kISOCGreen;
	toolBar.items = @[doneButton];
	[toolBar sizeToFit];
	
	[[UITextField appearance] setInputAccessoryView:toolBar];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	[SVProgressHUD showWithStatus:@"Loading..."];
}

- (void)dismissKeyboard:(id)sender {
	[self.view endEditing:YES];
}

@end
