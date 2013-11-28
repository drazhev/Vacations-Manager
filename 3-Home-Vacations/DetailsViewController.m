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
    self.latestVacation.bookDelegate = self;
    [self.latestVacation.bookDelegate reviewVacation:self.latestVacation];
    if ([self.latestVacation.name isEqualToString:@""]) {
        self.vacationNameLabel.text = @"Couldn't find vacations, sorry :(";
    }
    else {
        self.vacationNameLabel.text = self.latestVacation.name;
        self.vacationPriceLabel.text = [NSString stringWithFormat:@"%.1f",[self.latestVacation.price doubleValue]];
        self.vacationTypeLabel.text = vacationTypeStrings[self.latestVacation.type];
        self.vacationDescriptionField.text = self.latestVacation.description;
        
        NSString* currentImagePath;
        if ([self.latestVacation.name isEqualToString:@"St. Mina"]) {
            currentImagePath = @"SVMina.jpg";
        }
        else if ([self.latestVacation.name isEqualToString:@"Beklemeto"]) {
            currentImagePath = @"Villa.jpg";
        }
        else if ([self.latestVacation.name isEqualToString:@"Grand Hotel Velingrad"]) {
            currentImagePath = @"GrandHotelVelingrad.jpg";
        }
        else {
            currentImagePath = @"niagaraFalls.jpg";
        }
        UIImage* currentImage = [UIImage imageNamed:currentImagePath];
        // no need to call release on currentImagePath because it is created as a compile-time constant
        [self.vacationImageView setImage:currentImage];
    }
    
    if(&UIApplicationWillEnterForegroundNotification) {
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
    NSString* resultMessage;
    if ([generalBook.bookedVacations containsObject:self.latestVacation]) {
        resultMessage = @"Vacation is already booked.";
    }
    else if (![self.latestVacation.bookDelegate isVacation:self.latestVacation openForDate:[NSDate date]]) {
        resultMessage = @"Vacation is not open for booking today :(";
    }
    else {
        [self.latestVacation.bookDelegate goOnVacation:self.latestVacation];
        resultMessage = @"Vacation was successfully booked!";
    }
    // no need to call release on resultMessage because it is created as a compile-time constant
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:resultMessage
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}



- (BOOL) isVacation: (Vacation *) vacation openForDate: (NSDate*) date {
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    [weekday setDateFormat: @"EEEE"];
    
    for (NSString* weekDay in self.latestVacation.openDays) {
        if ([[weekday stringFromDate:date] isEqualToString:weekDay]) {
            [weekday release];
            return YES;
        }
    }
    [weekday release];
    return NO;
}

- (void) goOnVacation: (Vacation *) vacation {
    if ([vacation.bookDelegate isVacation:vacation openForDate:[NSDate date]]) {
        VacationBook* generalBook = [VacationBook sharedBook];
        [generalBook bookVacation: self.latestVacation];
    }
}

- (void) reviewVacation: (Vacation *) vacation {
    vacation.reviewCount++;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_latestVacation release];
    [_vacationNameLabel release];
    [_vacationPriceLabel release];
    [_vacationTypeLabel release];
    [_vacationDescriptionField release];
    [_vacationImageView release];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}
@end
