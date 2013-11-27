//
//  Vacation.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "Vacation.h"

@implementation Vacation

-(id) initWithType: (vacationType)type name: (NSString *)name description:(NSString *) description openDays: (NSMutableArray *)openDays andPrice:(NSNumber *) price {
    if (self = [super init]) {
        self.type = type;
        self.name = name;
        self.description = description;
        self.openDays = openDays;
        self.price = price;
        self.reviewCount = 0;
    }
    return self;
}

// default initializer

-(id) init {
    return [self initWithType:0 name:@"" description:@"" openDays:[NSMutableArray new] andPrice:[NSNumber numberWithInt:0]];
}

@end
