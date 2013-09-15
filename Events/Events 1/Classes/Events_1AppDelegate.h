//
//  Events_1AppDelegate.h
//  Events 1
//
//  Created by Peter McIntyre on 2010/09/19.
//  Copyright Seneca College 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Events_1ViewController;

@interface Events_1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Events_1ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Events_1ViewController *viewController;

@end
