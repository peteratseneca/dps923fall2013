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
    // Ivar to hold the full contents of the data store
    // Notice that it's mutable
    NSMutableDictionary *_dataStore;
}

// Private method that returns a file URL to the data store (in the Documents directory)
- (NSURL *)getFileUrl;

@end

@implementation Model {}

#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self) 
    {
        // If this app is being launched for the first time,
        // the data store will NOT exist in the app's Documents directory
        // In that situation, load the data store from the app bundle
        
        // In either situation, notice that we are working with a MUTABLE dictionary
        
        // So, here's how to do it...
        
        // Get a reference to a file system manager
        NSFileManager *fm = [[NSFileManager alloc] init];
        
        // If the data store exists...
        if ([fm fileExistsAtPath:[[self getFileUrl] path]])
        {
            // Load it
            _dataStore = [NSMutableDictionary dictionaryWithContentsOfURL:[self getFileUrl]];
        }
        else
        {
            // Othewise, read from the app bundle
            _dataStore = [NSMutableDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ICTCurriculum" withExtension:@"plist"]];
        }

        // Get the program code strings
        // Notice the sorting... this is the preferred approach when the array contains string elements
        _programs = [[_dataStore allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    }
    return self;
}

#pragma mark - Public interface (declared properties and methods)

- (id)addNewSubject:(NSString *)subjectCode named:(NSString *)subjectName inProgram:(NSString *)program withDescription:(NSString *)subjectDescription andURL:(NSString *)subjectOutlineURL
{
    // The PLIST structure is a dictionary, with three key-value pairs
    // At this top-most level (programs in ICT), a key holds a "Program" name, and its value is another dictionary
    // Let's look at one of these Program-level dictionaries...

    // At a "Program" level, its structure is also a dictionary, with key-value pairs for subjects in the program
    // A key holds a "Subject" code, and its value is another dictionary
    // Let's look at one of these Subject-level dictionaries...
    
    // At a "Subject" level, its structure is a collection of three key-value pairs (to hold the subject's info/detail)
    // The key names should suggest the string data that each holds (subject name, description, subject outline URL)
    
    // So... we want to add another subject to a program
    // We'll have to create a dictionary to hold a subject's details
    // Then, we'll have to add it to a specific program's subjects
    
    // Package the subject info/detail into a dictionary...
    NSDictionary *subjectInfo = [NSDictionary dictionaryWithObjectsAndKeys:subjectName, @"Subject Name", subjectDescription, @"Description", subjectOutlineURL, @"Subject Outline URL", nil];
    
    // Fetch the dictionary for the relevant program...
    NSMutableDictionary *relevantProgram = (NSMutableDictionary *)[_dataStore objectForKey:program];
    
    // Add the new subject to the data store
    [relevantProgram setObject:subjectInfo forKey:subjectCode];

    // Return the dictionary that was just added
    return [NSDictionary dictionaryWithObjectsAndKeys:subjectInfo, subjectCode, nil];
}

- (NSArray *)subjectsInProgram:(NSString *)program
{
    // Get the dictionary object for a specific program
    NSDictionary *d = [_dataStore valueForKey:program];

    // Return an array of the subject code strings
    // Notice the sorting... this is the preferred approach when the array contains string elements
    return [[d allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSDictionary *)subject:(NSString *)subject
{
    // Look through the data store for the subject info

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

- (void)saveState
{
    // Save the data store
    [_dataStore writeToURL:[self getFileUrl] atomically:YES];
}

- (NSURL *)getFileUrl
{
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"Model.plist"];
}

@end
