//
//  SplashViewController.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/20/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	CGFloat ht = self.view.frame.size.height;
	switch ((int)ht) {
		case 736:
			self.splashImageView.image = [UIImage imageNamed:@"Splash-736h"];
			break;
		case 667:
			self.splashImageView.image = [UIImage imageNamed:@"Splash-667h"];
			break;
		case 568:
			self.splashImageView.image = [UIImage imageNamed:@"Splash-568h"];
			break;
		case 480:
			self.splashImageView.image = [UIImage imageNamed:@"Splash"];
			break;
		default:
			self.splashImageView.image = [UIImage imageNamed:@"Splash-736h"];
			
	}
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
