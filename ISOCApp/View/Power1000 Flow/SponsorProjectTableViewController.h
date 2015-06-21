//
//  SponsorProjectTableViewController.h
//  ISOCApp
//
//  Created by Matthew Gardner on 6/6/15.
//  Copyright (c) 2015 Matthew Gardner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SponsorProjectTableViewController : UITableViewController {
	NSArray *amounts, *donateButtons, *areaButtons, *projects;
	uint selectedArea;
}

@property (strong, nonatomic) NSString *infoText, *titleText;
@property (nonatomic) int amt1, amt2, amt3, amt4;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *otherAmtLabel;
@property (weak, nonatomic) IBOutlet UIButton *amtButton1;
@property (weak, nonatomic) IBOutlet UIButton *amtButton2;
@property (weak, nonatomic) IBOutlet UIButton *amtButton3;
@property (weak, nonatomic) IBOutlet UIButton *amtButton4;
@property (weak, nonatomic) IBOutlet UILabel *amtLabel1;
@property (weak, nonatomic) IBOutlet UILabel *amtLabel2;
@property (weak, nonatomic) IBOutlet UILabel *amtLabel3;
@property (weak, nonatomic) IBOutlet UILabel *amtLabel4;

@property (weak, nonatomic) IBOutlet UIButton *area1Button;
@property (weak, nonatomic) IBOutlet UIButton *area2Button;
@property (weak, nonatomic) IBOutlet UIButton *area3Button;
@property (weak, nonatomic) IBOutlet UIButton *area4Button;
@property (weak, nonatomic) IBOutlet UIButton *area5Button;
@property (weak, nonatomic) IBOutlet UIButton *area6Button;
@property (weak, nonatomic) IBOutlet UIButton *area7Button;
@property (weak, nonatomic) IBOutlet UIButton *area8Button;
@property (weak, nonatomic) IBOutlet UIButton *generalButton;
@property (weak, nonatomic) IBOutlet UILabel *project1Label;
@property (weak, nonatomic) IBOutlet UILabel *project2Label;
@property (weak, nonatomic) IBOutlet UILabel *project3Label;
@property (weak, nonatomic) IBOutlet UILabel *project4Label;
@property (weak, nonatomic) IBOutlet UILabel *project5Label;
@property (weak, nonatomic) IBOutlet UILabel *project6Label;
@property (weak, nonatomic) IBOutlet UILabel *project7Label;
@property (weak, nonatomic) IBOutlet UILabel *project8Label;

- (IBAction)areaPressed:(id)sender;
- (IBAction)amountPressed:(id)sender;

@end
