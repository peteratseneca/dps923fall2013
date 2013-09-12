//
//  AppDelegate.h
//  App Struct
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

// An "application delegate" is a singleton object that performs 
// application-scope tasks (i.e. it has methods); its methods can be called
// by the Cocoa runtime as events happen in the runtime environment,
// or from other objects/classes in this app/project

// Declare instance variables, properties, and methods in this @interface

#import <UIKit/UIKit.h>

// The interface declaration block; starts with @interface, ends with @end
// How to read the next line of code?

// "The AppDelegate interface inherits from UIResponder,
// and conforms to the UIApplicationDelegate protocol"

// This means that the class has all the characteristics of UIResponder,
// and will implement some of the methods in the UIApplicationDelegate protocol

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    // If required...
    // Declare instance variables here, in the @interface curly brace block
	
	// When you declare an instance variable, it has class scope
	// You must initialize it, and this task is done in the implementation
	// in a method that is called (by the Cocoa runtime) during app startup
	
	// In addition to declaring class-level instance variables, you can also
	// create block-level variables inside of code blocks in the implementation;
	// those variables have block scope only (within their block)

}

// Declare properties and methods here, before the @end directive

@property (strong, nonatomic) UIWindow *window;

@end
