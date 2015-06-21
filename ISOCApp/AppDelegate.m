//
//  AppDelegate.m
//  ISOCApp
//
//  Created by Matthew Gardner on 5/27/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "ISOCDataProvider.h"
#import "SVProgressHUD.h"
#import "ISOCGlobals.h"
#import "MGAlertUtility.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[[UINavigationBar appearance] setTranslucent:NO];
	
	UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
	[self performSelector:@selector(removeSplashScreen) withObject:nil afterDelay:2];
	navVC = [sb instantiateViewControllerWithIdentifier:@"mainNavVC"];
	
	[SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.398 green:0.407 blue:0.415 alpha:0.860]];
	[SVProgressHUD setForegroundColor:[UIColor whiteColor]];
	
	[ISOCDataProvider init];
	ISOCGlobals *globals = [ISOCGlobals getVar];
	globals.appContent = [[[NSUserDefaults standardUserDefaults] objectForKey:@"appContent"] mutableCopy];
	globals.titles = [[[NSUserDefaults standardUserDefaults] objectForKey:@"committeeTitles"] mutableCopy];
	globals.descriptions = [[[NSUserDefaults standardUserDefaults] objectForKey:@"committeeDescs"] mutableCopy];
	globals.lastContentSync = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastSync"];
	if (globals.appContent == nil) {
		[ISOCDataProvider initAppContent];
	}
	if (!globals.lastContentSync || [globals.lastContentSync timeIntervalSinceNow] < -60 * 60 * 24) {
		[ISOCDataProvider fetchAppContent];
		[ISOCDataProvider fetchTodayISOCContent];
		globals.lastContentSync = [NSDate date];
	}

	return YES;
}

- (void) removeSplashScreen
{
	[splashVC.view removeFromSuperview];
	self.window.rootViewController = navVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	[[NSUserDefaults standardUserDefaults] setObject:[ISOCGlobals getVar].appContent forKey:@"appContent"];
	[[NSUserDefaults standardUserDefaults] setObject:[ISOCGlobals getVar].titles forKey:@"committeeTitles"];
	[[NSUserDefaults standardUserDefaults] setObject:[ISOCGlobals getVar].descriptions forKey:@"committeeDescs"];
	[[NSUserDefaults standardUserDefaults] setObject:[ISOCGlobals getVar].appContent forKey:@"appContent"];
	[[NSUserDefaults standardUserDefaults] setObject:[ISOCGlobals getVar].lastContentSync forKey:@"lastSync"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	NSLog(@"App content saved");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	ISOCGlobals *globals = [ISOCGlobals getVar];
	if (globals.confirmation != nil) {
		[MGAlertUtility showOKAlertWithMessage:globals.confirmation title:@"Confirmation"];
		globals.confirmation = nil;
	}
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
