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
        _availableVacations = [NSMutableArray new];
        _bookedVacations = [NSMutableArray new];
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
            [latestVacation release];
            latestVacation = object;
            [latestVacation retain];
        }
    }
    return [latestVacation autorelease];
}


-(NSString *) genRandStringLength: (int) len {
    NSString *letters = @"abcde fghij klmno pqrst uvwxy zABCD EFGHI JKLMN OPQRS TUVWX YZ";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

- (Vacation *)generateVacation {
    NSMutableArray* weekDays = [NSMutableArray arrayWithObjects: @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil];
    Vacation* randomVacation = [Vacation new];
    NSInteger descriptionLength = arc4random() % 700 + 300;
    NSInteger nameLength = arc4random() % 15 + 5;
    NSInteger locationLength = arc4random() % 12 + 8;
    NSInteger openDaysCount = arc4random() % 7 + 1;
    randomVacation.type = arc4random() % 3;
    randomVacation.description = [self genRandStringLength:descriptionLength];
    randomVacation.name = [self genRandStringLength:nameLength];
    randomVacation.location = [self genRandStringLength:locationLength];
    randomVacation.price = [NSNumber numberWithInt:arc4random() % 300];
    for (int i=0; i<openDaysCount; i++) {
        NSInteger randomWeekDayNumber = arc4random() % [weekDays count];
        [randomVacation.openDays addObject:weekDays[randomWeekDayNumber]];
        [weekDays removeObject:weekDays[randomWeekDayNumber]];
    }
    return [randomVacation autorelease];
}

-(void) dealloc {
    // no need to implement dealloc here
    // because the class is a singleton
    // and is made to live the entire time
    [super dealloc];
}
@end
