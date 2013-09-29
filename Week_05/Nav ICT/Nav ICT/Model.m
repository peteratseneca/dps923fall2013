//
//  Model.m
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/02/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@interface Model ()
{
    // Private ivar that holds the full contents of the data store
    NSDictionary *_dataStore;
}

@end

@implementation Model {}

#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self)
    {
        // Read from the app bundle
        _dataStore = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ICTCurriculum" withExtension:@"plist"]];
        
        // Get the program code strings
        // Notice the sorting... this is the preferred approach when the array contains string elements
        _programs = [[_dataStore allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    return self;
}

#pragma mark - Public interface (declared properties and methods)

- (NSArray *)subjectsInProgram:(NSString *)program
{
    // Get the dictionary object for a specific program
    NSDictionary *d = [_dataStore valueForKey:program];

    // Return an array of the subject code strings
    return [d allKeys];
}

- (NSDictionary *)subject:(NSString *)subject
{
    // Look through the data store for the subject info
    
    // I am not real happy with the design of this
    // It helps show why a plist would not be a really good idea for a data store

    // Declare a dictionary, which will become the method's return value
    NSDictionary *d = nil;
    
    // NSDictionary "fast enumeration"
    // See this: http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/objectivec/Chapters/ocFastEnumeration.html 
    
    // For each string key in the data store...
    for (NSString *pkey in _dataStore) 
    {
        // Fetch the next-level data, which is a dictionary
        // Specifically, a dictionary of subjects in a program 
        NSDictionary *p = [_dataStore valueForKey:pkey];

        // Attempt to get the specific dictionary that matches the desired subject
        // If it succeeds, the subject's dictionary is returned 
        // If not found, an EMPTY dictionary is returned (i.e. no keys and values) 
        NSDictionary *s = [p valueForKey:subject];

        // If it's non-empty, then we've found our result (and can stop looking) 
        if ([s count] > 0) {
            d = s;
            break;
        }
    }

    return d;
}

@end
