//
//  Events_1AppDelegate.m
//  Events 1
//
//  Created by Peter McIntyre on 2010/09/19.
//  Copyright Seneca College 2010. All rights reserved.
//

#import "Events_1AppDelegate.h"
#import "Events_1ViewController.h"

@implementation Events_1AppDelegate

@synthesize window;
@synthesize viewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	// Update the string
	viewController.allEvents = [NSString stringWithFormat:@"%@\n%s", viewController.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);

    // Override point for customization after application launch.
    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	
	// Update the string
	viewController.allEvents = [NSString stringWithFormat:@"%@\n%s", viewController.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */

	// Update the string
	viewController.allEvents = [NSString stringWithFormat:@"%@\n%s", viewController.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

	// Update the string
	viewController.allEvents = [NSString stringWithFormat:@"%@\n%s", viewController.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application {

	// Update the string
	viewController.allEvents = [NSString stringWithFormat:@"%@\n%s", viewController.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {

	// Update the string
	viewController.allEvents = [NSString stringWithFormat:@"%@\n%s", viewController.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);

    [viewController release];
    [window release];
    [super dealloc];
}

@end
