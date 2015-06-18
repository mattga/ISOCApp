//
//  RamadanCollectionViewCell.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/11/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RamadanCollectionViewCell : UICollectionViewCell

@property(nonatomic) int index;

@property(weak, nonatomic) IBOutlet UILabel *dayLabel;
@property(weak, nonatomic) IBOutlet UILabel *sponsorsLabel;
@property(weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
