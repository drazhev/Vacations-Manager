//
//  Vacation.h
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrokerDelegate.h"

typedef enum vacationType{
    Monastery,
    Villa,
    Hotel
} vacationType;


@interface Vacation : NSObject

@property (nonatomic) vacationType type;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* description;
@property (nonatomic, retain) NSMutableArray* openDays;
@property (nonatomic, retain) NSNumber* price;
@property (nonatomic) NSInteger reviewCount;
@property (nonatomic, assign) id<BrokerDelegate> bookDelegate;

// designated initializer
-(id) initWithType: (vacationType)type name: (NSString *)name description:(NSString *) description openDays: (NSMutableArray *)openDays andPrice:(NSNumber *) price;

@end
