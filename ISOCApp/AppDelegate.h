//
//  AppDelegate.h
//  ISOCApp
//
//  Created by Matthew Gardner on 5/27/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SplashViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
	SplashViewController *splashVC;
	UINavigationController *navVC;
}

@property (strong, nonatomic) UIWindow *window;

@end

