//
//  EidInfoViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 5/30/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface EidInfoViewController : DetailViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *locLabel;
@property (weak, nonatomic) IBOutlet UILabel *prayerTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;

@end
