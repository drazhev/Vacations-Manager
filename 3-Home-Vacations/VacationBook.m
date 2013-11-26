//
//  VacationBook.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "VacationBook.h"

@implementation VacationBook

-(id) init {
    if (self = [super init]) {
        self.availableVacations = [NSMutableArray new];
        self.bookedVacations = [NSMutableArray new];
    }
    return self;
}
+(id) sharedBook {
    static VacationBook *sharedBook = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedBook = [[VacationBook alloc] init];
    });
    return sharedBook;
}

-(void)addVacation:(Vacation *)vacation {
    [self.availableVacations addObject:vacation];
}

-(void)removeVacation:(Vacation *)vacation {
    if ([self.availableVacations containsObject:vacation]) {
        [self.availableVacations removeObject:vacation];
        if ([self.bookedVacations containsObject:vacation]) {
            [self.bookedVacations removeObject:vacation];
        }
    }
}

-(void)bookVacation:(Vacation *)vacation {
    if (![self.bookedVacations containsObject:vacation]) {
        [self.bookedVacations addObject:vacation];
    }
}

-(void)inactiveVacation:(Vacation *)vacation {
    if ([self.bookedVacations containsObject:vacation]) {
        [self.bookedVacations removeObject:vacation];
    }
}


- (Vacation *)latestVacation {
    Vacation* latestVacation = [Vacation new];
    for (Vacation* object in self.availableVacations) {
        if (object.type == self.chosenType) {
            latestVacation = object;
        }
    }
    return [latestVacation autorelease];
}


@end
