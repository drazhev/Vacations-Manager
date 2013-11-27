//
//  Vacation.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "Vacation.h"

@implementation Vacation

-(id) initWithType: (vacationType)type name: (NSString *)name description:(NSString *) description location:(NSString *) location openDays: (NSMutableArray *)openDays andPrice:(NSNumber *) price {
    if (self = [super init]) {
        _type = type;
        _name = [name retain];
        _description = [description retain];
        _location = [location retain];
        _openDays = [openDays retain];
        _price = [price retain];
        _reviewCount = 0;
    }
    return self;
}

// default initializer

-(id) init {
    return [self initWithType:0 name:@"" description:@"" location: @"" openDays:[[NSMutableArray new] autorelease] andPrice:[NSNumber numberWithInt:0]];
}

-(void) dealloc {
    [_name release];
    [_description release];
    [_location release];
    [_openDays release];
    [_price release];
    [super dealloc];
}

@end
