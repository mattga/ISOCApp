//
//  CommitteeTableViewCell.m
//  ISOCApp
//
//  Created by Matthew Gardner on 6/2/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import "CommitteeTableViewCell.h"
#import "Constants.h"

@implementation CommitteeTableViewCell

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[self.selectButton setImage:[UIImage imageNamed:@"btn_checked"] forState:UIControlStateSelected];
	[self.selectButton setImage:[UIImage imageNamed:@"btn_uncheck"] forState:UIControlStateNormal];

}

@end
