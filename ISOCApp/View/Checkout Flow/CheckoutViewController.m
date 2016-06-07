//
//  InPersonViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/21/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "CheckoutViewController.h"

@interface CheckoutViewController ()

@end

@implementation CheckoutViewController
@synthesize ccConfirm, ipConfirm, params;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
	[self.view addGestureRecognizer:tapGesture];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"embedInfo"]) {
		tvc = segue.destinationViewController;
		tvc.ccConfirm = ccConfirm;
		tvc.ipConfirm = ipConfirm;
		tvc.params = params;
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[SVProgressHUD dismiss];
}

@end
