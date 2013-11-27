//
//  BrokerDelegate.h
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/27/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vacation;

@protocol BrokerDelegate <NSObject>

- (void) goOnVacation: (Vacation *) vacation;

- (BOOL) isVacation: (Vacation *) vacation openForDate: (NSDate*) date;

- (void) reviewVacation: (Vacation *) vacation;

@end
