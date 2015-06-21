//
//  RiverAlertUtility.h
//  River
//
//  Created by Matthew Gardner on 5/19/14.
//  Copyright (c) 2014 mdg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface MGAlertUtility : NSObject

+ (UIAlertController*)showErrorMessage:(NSError*)error onView:(UIViewController*)view;
+ (UIAlertController*)showOKAlertWithMessage:(NSString*)message title:(NSString*)title onView:(UIViewController*)view;
+ (UIAlertController*)showOKAlertWithMessage:(NSString*)message title:(NSString*)title;
+ (UIAlertController*)showOKAlertWithMessage:(NSString*)message title:(NSString*)title onView:(UIViewController*)view okAction:(void (^)(UIAlertAction *action))action;
+ (UIAlertController *)showYesNoAlertWithMessage:(NSString *)message title:(NSString*)title onView:(UIViewController*)view okAction:(void (^)(UIAlertAction *action))action;
+ (UIAlertController *)showInputAlertWithMessage:(NSString *)message title:(NSString *)title onView:(UIViewController *)view textHandler:(void (^)(UITextField *field))textHandler okAction:(void (^)(UIAlertAction *action))action;

+ (UIAlertController *)showCancelActionSheet:(NSString*)title message:(NSString*)message actions:(NSDictionary*)actions;
+ (UIAlertController *)showActionSheet:(NSString*)title message:(NSString*)message actions:(NSDictionary*)actions;

@end
