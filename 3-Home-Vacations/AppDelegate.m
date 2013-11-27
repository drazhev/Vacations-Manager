//
//  AppDelegate.m
//  3-Home-Vacations
//
//  Created by Alexandar Drajev on 11/26/13.
//  Copyright (c) 2013 Alexander Drazhev. All rights reserved.
//

#import "AppDelegate.h"
#import "CategoriesViewController.h"
#import "DetailsViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([prefs integerForKey:@"runCount"]) {
        [prefs setInteger:[prefs integerForKey:@"runCount"] + 1 forKey:@"runCount"];
    }
    else {
        [prefs setInteger:1 forKey:@"runCount"];
    }
    [prefs synchronize];
    
    VacationBook* generalBook = [VacationBook sharedBook];
    
    NSString *initialVacationsPath = [[NSBundle mainBundle] pathForResource:@"InitialVacations" ofType:@"plist"];
    NSArray *initialVacationsArray = [[NSArray alloc] initWithContentsOfFile:initialVacationsPath];
    for (NSDictionary* currentVacation in initialVacationsArray) {
        Vacation* vacationToBeAdded = [[Vacation alloc] initWithType:[currentVacation[@"type"] intValue]name:currentVacation[@"name"] description:currentVacation[@"description"] location: currentVacation[@"location"] openDays:currentVacation[@"openDays"] andPrice:currentVacation[@"price"]];
        [generalBook addVacation: vacationToBeAdded];
        [vacationToBeAdded release];
    }
    [initialVacationsArray release];
    
    for (int i = 0; i < [prefs integerForKey:@"runCount"] - 1; i++) {
        [generalBook addVacation: [generalBook generateVacation]];
    }
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    VacationBook* generalBook = [VacationBook sharedBook];
    for (Vacation* currentVacation in generalBook.availableVacations) {
        currentVacation.price = [NSNumber numberWithFloat:[currentVacation.price intValue] * 6/5];
    }

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
