//
//  IftarTableViewCell.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/11/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
	Dinner,
	IftarChildrenMeals,
	Iftar,
	SuppliesCleaning
} SponsorType;

@interface SponsorTableViewCell : UITableViewCell

@property (nonatomic) SponsorType type;
@property (strong, nonatomic) UIViewController *iftarDetailVC;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)buttonPressed:(id)sender;

@end
