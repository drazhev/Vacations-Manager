//
//  ViewController.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "CategoriesViewController.h"


@interface CategoriesViewController ()

@end

@implementation CategoriesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Categories";
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
    [super dealloc];
}
@end
