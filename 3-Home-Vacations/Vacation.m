//
//  Vacation.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "Vacation.h"



@implementation Vacation

-(id) initWithType: (vacationType)type name: (NSString *)name description:(NSString *) description openDays: (NSMutableArray *)openDays price:(NSNumber *) price andReviewCount:(NSInteger) reviewCount {
    if (self = [super init]) {
        self.type = type;
        self.name = name;
        self.description = description;
        self.openDays = openDays;
        self.price = price;
        self.reviewCount = reviewCount;
    }
    return self;
}

// default initializer

-(id) init {
    return [self initWithType:0 name:@"" description:@"" openDays:[NSMutableArray new] price:[NSNumber numberWithInt:0] andReviewCount:0];
}

@end
