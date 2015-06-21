//
//  ViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/27/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "HomeViewController.h"
#import "SVProgressHUD.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	for (UIButton *button in self.buttonsView.subviews) {
		button.layer.shadowRadius = 3;
		button.layer.shadowOpacity = .1;
		button.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
		button.layer.shadowColor = [UIColor blackColor].CGColor;
	}
	
	if (self.view.frame.size.height < 500) {
		self.ramadanImageView.hidden = YES;
		self.isoc40ImageView.hidden = YES;
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[SVProgressHUD dismiss];
}

@end
