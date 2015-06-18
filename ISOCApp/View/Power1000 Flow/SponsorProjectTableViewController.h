//
//  SponsorProjectTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SponsorProjectTableViewController : UITableViewController {
	NSArray *donateButtons, *areaButtons;
	uint selectedArea;
}

@property (weak, nonatomic) IBOutlet UIButton *area1Button;
@property (weak, nonatomic) IBOutlet UIButton *area2Button;
@property (weak, nonatomic) IBOutlet UIButton *area3Button;
@property (weak, nonatomic) IBOutlet UIButton *area4Button;
@property (weak, nonatomic) IBOutlet UIButton *area5Button;
@property (weak, nonatomic) IBOutlet UILabel *project1Label;
@property (weak, nonatomic) IBOutlet UILabel *project2Label;
@property (weak, nonatomic) IBOutlet UILabel *project3Label;
@property (weak, nonatomic) IBOutlet UILabel *project4Label;

- (IBAction)areaPressed:(id)sender;

@end
