//
//  RiverAlertUtility.m
//  River
//
//  Created by Matthew Gardner on 5/19/14.
//  Copyright (c) 2014 mdg. All rights reserved.
//

#import "MGAlertUtility.h"

@implementation MGAlertUtility

+ (UIAlertController *)showErrorMessage:(NSError *)error onView:(UIViewController *)view {
	return [MGAlertUtility showOKAlertWithMessage:error.localizedDescription
											title:@"ERROR"
										   onView:view];
}

+ (UIAlertController *)showOKAlertWithMessage:(NSString *)message title:(NSString *)title onView:(UIViewController *)view {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"OK"
														   style:UIAlertActionStyleDefault
														 handler:^(UIAlertAction *action) {
															 [alert dismissViewControllerAnimated:YES completion:nil];
														 }];
	
	[alert addAction:alertAction1];
	
	[view presentViewController:alert animated:YES completion:nil];
	
	return alert;
}

+ (UIAlertController *)showOKAlertWithMessage:(NSString *)message title:(NSString *)title {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"OK"
														   style:UIAlertActionStyleDefault
														 handler:^(UIAlertAction *action) {
															 [alert dismissViewControllerAnimated:YES completion:nil];
														 }];
	
	[alert addAction:alertAction1];
	
	[[[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:alert
																				   animated:YES
																				 completion:nil];
	
	return alert;
}

+ (UIAlertController *)showOKAlertWithMessage:(NSString *)message title:(NSString *)title onView:(UIViewController *)view okAction:(void (^)(UIAlertAction *))action {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"OK"
														   style:UIAlertActionStyleDefault
														 handler:action];
	
	[alert addAction:alertAction1];
	
	[view presentViewController:alert animated:YES completion:nil];
	
	return alert;
}

+ (UIAlertController *)showYesNoAlertWithMessage:(NSString *)message title:(NSString*)title onView:(UIViewController*)view okAction:(void (^)(UIAlertAction *action))action {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																	   message:message
																preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"Yes"
														   style:UIAlertActionStyleDefault
														 handler:action];
	UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"No"
														   style:UIAlertActionStyleDefault
														 handler:^(UIAlertAction *action) {
															 [alert dismissViewControllerAnimated:YES completion:nil];
														 }];
	
	[alert addAction:alertAction1];
	[alert addAction:alertAction2];

	[view presentViewController:alert animated:YES completion:nil];
	
	return alert;
}

+ (UIAlertController *)showInputAlertWithMessage:(NSString *)message title:(NSString *)title onView:(UIViewController *)view textHandler:(void (^)(UITextField *field))textHandler okAction:(void (^)(UIAlertAction *action))action {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
	[alert addTextFieldWithConfigurationHandler:textHandler];
	
	UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"OK"
														   style:UIAlertActionStyleDefault
														 handler:action];
	UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"Cancel"
														   style:UIAlertActionStyleDefault
														 handler:^(UIAlertAction *action) {
															 [alert dismissViewControllerAnimated:YES completion:nil];
														 }];
	
	[alert addAction:alertAction1];
	[alert addAction:alertAction2];
	
	[view presentViewController:alert animated:YES completion:nil];
	
	return alert;
}

+ (UIAlertController *)showCancelActionSheet:(NSString*)title message:(NSString*)message actions:(NSDictionary*)actions {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleActionSheet];
	
	[actions enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		UIAlertAction *action = [UIAlertAction actionWithTitle:key
														 style:UIAlertActionStyleDefault
													   handler:obj];
		[alert addAction:action];
	}];
	[alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
											  style:UIAlertActionStyleCancel
											handler:^(UIAlertAction *action) {
												[alert dismissViewControllerAnimated:YES completion:nil];
											}]];
	
	[[[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:alert
																				   animated:YES
																				 completion:nil];
	
	return alert;
}


+ (UIAlertController *)showActionSheet:(NSString*)title message:(NSString*)message actions:(NSDictionary*)actions {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleActionSheet];
	
	[actions enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		UIAlertAction *action = [UIAlertAction actionWithTitle:key
														 style:UIAlertActionStyleDefault
													   handler:obj];
		[alert addAction:action];
	}];
	
	[[[UIApplication sharedApplication].keyWindow rootViewController] presentViewController:alert
																				   animated:YES
																				 completion:nil];
	
	return alert;
}


@end
