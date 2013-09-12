//
//  AppDelegate.m
//  App Struct
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

// Implement properties and methods in this @implementation

// Make sure that you import the headers of source code files that 
// have objects that you need to access in this source code file

#import "AppDelegate.h"

@implementation AppDelegate

// Properties are synthesized here (i.e. the compiler creates their accessor methods)

@synthesize window = _window;

// Methods (overrides and user-created) are implemented here

// Why are these methods here? They are part of the source code file template 
// that is used when you create a "New File..."

// Where are these methods defined? They aren't in the interface file, are they?
// Well, these methods are defined in the superclass (UIResponder) and/or the
// protocols that this class conforms to (only UIApplicationDelegate in this situation)

// Command+click on top of the method name to "Jump to Definition" of the method
// This action will tell you where it was defined (look at the window's title)
// From there, you can Option+click on top of the method name to view its "Quick Help"
// From there (optionally), you can click the Quick Help panel's "Reference" link to open
// the full-fidelity documentation page

// As in C, a #pragma is a compiler directive
// Here, it simply helps you and Xcode organize method groups for easy access in the Jump Bar

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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
