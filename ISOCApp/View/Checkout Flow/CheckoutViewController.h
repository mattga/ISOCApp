//
//  InPersonViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/21/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailViewController.h"
#import "CheckoutTableViewController.h"

@interface CheckoutViewController : DetailViewController {
	CheckoutTableViewController *tvc;
}

@property (strong, nonatomic) NSDictionary *params;
@property (strong, nonatomic) NSString *ipConfirm, *ccConfirm;

@end
