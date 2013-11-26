//
//  VacationBook.h
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vacation.h"

@interface VacationBook : NSObject

@property (nonatomic, retain) NSMutableArray* availableVacations;
@property (nonatomic, retain) NSMutableArray* bookedVacations;
@property (nonatomic) vacationType chosenType;

- (void)addVacation: (Vacation *) vacation;
- (void)removeVacation: (Vacation *) vacation;
- (void)bookVacation: (Vacation *) vacation;
- (void)inactiveVacation: (Vacation *) vacation;
- (Vacation *)generateVacation;
- (Vacation *)latestVacation;

+ (id) sharedBook;

@end
