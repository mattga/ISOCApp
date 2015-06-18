//
//  BaseTableViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "BaseTableViewController.h"

@implementation BaseTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard:)];
	doneButton.tintColor = kISOCWhite;
	
	UIToolbar* toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
	toolBar.barStyle = UIBarStyleBlackOpaque;
	toolBar.barTintColor = kISOCGreen;
	toolBar.items = @[doneButton];
	[toolBar sizeToFit];
	
	[[UITextField appearance] setInputAccessoryView:toolBar];
}

- (void)dismissKeyboard:(id)sender {
	[self.view endEditing:YES];
}

@end
