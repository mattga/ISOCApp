//
//  DetailViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/30/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize homeButton;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Home bar button
	homeButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_home"]
												  style:UIBarButtonItemStylePlain
												 target:self action:@selector(goHome:)];
	self.navigationItem.rightBarButtonItem = homeButton;
	self.navigationItem.rightBarButtonItem.tintColor = kISOCWhite;
	
	UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[backButton setFrame:CGRectMake(0., 0., 22., 22.)];
	[backButton setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
	[backButton addTarget:self action:@selector(backPressed:) forControlEvents:UIControlEventTouchUpInside];
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
	self.navigationItem.leftBarButtonItem.tintColor = kISOCWhite;
}

- (void)backPressed:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)goHome:(id)sender {
	[self.navigationController popToRootViewControllerAnimated:YES];
}

@end
