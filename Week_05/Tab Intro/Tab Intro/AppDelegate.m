//
//  AppDelegate.m
//  Tab Intro
//
//  Created by Peter McIntyre on 2012/06/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Recommended (required) pattern for a tab bar app
    
    // Get a reference to the tab bar controller
    UITabBarController *tbc = (UITabBarController *)self.window.rootViewController;
    
    // Get a reference to specific view controllers
    FirstViewController *vc1 = (FirstViewController *)[tbc.viewControllers objectAtIndex:0];
    SecondViewController *vc2 = (SecondViewController *)[tbc.viewControllers objectAtIndex:1];
    
    // Create and assign a model object, to all controllers that need it
    Model *model = [[Model alloc] init];
    vc1.model = model;
    vc2.model = model;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
