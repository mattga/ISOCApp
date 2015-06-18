//
//  CommitteeTableViewCell.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/2/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommitteeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
