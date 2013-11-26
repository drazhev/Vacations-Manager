//
//  DetailsViewController.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *vacationTypeStrings = @[@"Monastery", @"Villa", @"Hotel"];
    VacationBook* generalBook = [VacationBook sharedBook];
    self.latestVacation = [generalBook latestVacation];
    if ([self.latestVacation.name isEqualToString:@""]) {
        self.vacationNameLabel.text = @"Couldn't find vacations, sorry :(";
    }
    else {
        self.vacationNameLabel.text = self.latestVacation.name;
        self.vacationPriceLabel.text = [NSString stringWithFormat:@"%.1f",[self.latestVacation.price doubleValue]];
        self.vacationTypeLabel.text = vacationTypeStrings[self.latestVacation.type];
        self.vacationDescriptionField.text = self.latestVacation.description;
    }
    
    if(&UIApplicationWillEnterForegroundNotification) { //needed to run on older devices, otherwise you'll get EXC_BAD_ACCESS
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter addObserver:self selector:@selector(enteredForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    }
    
    
	// Do any additional setup after loading the view.
}

-(void) enteredForeground: (NSNotification*) not {
    self.vacationPriceLabel.text = [NSString stringWithFormat:@"%.1f",[self.latestVacation.price doubleValue]];

}

- (IBAction)bookButtonTapped:(id)sender {

    VacationBook* generalBook = [VacationBook sharedBook];
    [generalBook bookVacation: self.latestVacation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_vacationNameLabel release];
    [_vacationPriceLabel release];
    [_vacationTypeLabel release];
    [_vacationDescriptionField release];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}
@end
