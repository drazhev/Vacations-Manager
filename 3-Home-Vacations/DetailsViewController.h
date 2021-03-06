//
//  DetailsViewController.h
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrokerDelegate.h"
#import "VacationBook.h"

@interface DetailsViewController : UIViewController <BrokerDelegate>

@property (retain, nonatomic) IBOutlet UILabel *vacationNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *vacationPriceLabel;
@property (retain, nonatomic) IBOutlet UILabel *vacationTypeLabel;
@property (retain, nonatomic) IBOutlet UITextView *vacationDescriptionField;
@property (retain, nonatomic) IBOutlet UIImageView *vacationImageView;

@end
