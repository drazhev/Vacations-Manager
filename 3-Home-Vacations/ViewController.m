//
//  ViewController.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Categories";
    VacationBook* generalBook = [VacationBook sharedBook];
    NSString *initialVacationsPath = [[NSBundle mainBundle] pathForResource:@"InitialVacations" ofType:@"plist"];
    NSArray *initialVacationsArray = [[NSArray alloc] initWithContentsOfFile:initialVacationsPath];
    for (NSDictionary* currentVacation in initialVacationsArray) {
        [generalBook addVacation: [[Vacation alloc] initWithType:[currentVacation[@"type"] intValue]name:currentVacation[@"name"] description:currentVacation[@"description"] openDays:currentVacation[@"openDays"] andPrice:currentVacation[@"price"]]];
    }
//    Vacation* newVac = [Vacation new];
//    newVac.name = @"Random";
//    newVac.type = Monastery;
//    newVac.price = [NSNumber numberWithInt:49];
//    [generalBook addVacation:newVac];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VacationBook* currentBook = [VacationBook sharedBook];
    if ([segue.identifier isEqualToString:@"monasteryType"]) {
        currentBook.chosenType = Monastery;
    }
    else if ([segue.identifier isEqualToString:@"villaType"]) {
        currentBook.chosenType = Villa;
    }
    else if ([segue.identifier isEqualToString:@"hotelType"]) {
        currentBook.chosenType = Hotel;
    }
}


- (void)dealloc {
    [_monasteryButton release];
    [super dealloc];
}
@end
