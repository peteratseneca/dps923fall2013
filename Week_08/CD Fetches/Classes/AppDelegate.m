//
//  AppDelegate.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/25.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AppDelegate.h"
#import "AppMenu.h"

@implementation AppDelegate {}

#pragma mark - App lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // General approach for displaying the app's first scene...
    
    // Get a reference to the scene by going through the window object's hierarchy
    // Simple view-based app: window root view controller > view controller
    // Nav-based app: window root view controller > nav controller > view controller
    // Tab bar app: window root view controller > tab bar controller > view controller
    // Nav on tab app: window root view controller > tab bar controller > nav controller > view controller
    
    // Then, initialize the app's model object
    
    // Finally, pass on the model object to the scene controllers that need it

    // Get a reference to the scene by going through the window object's hierarchy
    // Nav-based app: window root view controller > nav controller > view controller
    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    AppMenu *vc = (AppMenu *)nav.topViewController;
    
    // Then, initialize the app's model object
    Model *model = [[Model alloc] init];
    
    // Finally, pass on the model object to the scene controllers that need it
    vc.model = model;

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
