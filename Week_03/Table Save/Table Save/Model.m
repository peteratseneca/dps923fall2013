//
//  Model.m
//  Table Save
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

// Private members
@interface Model ()
{
    // URL to the object store file in the Documents directory
    NSURL *_storeFileInDocumentsDirectory;
}

// Create data
- (NSArray *)createTeams;

// App's Documents directory
- (NSURL *)applicationDocumentsDirectory;

@end

@implementation Model

#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self) {

        // If the data has been saved (in the Documents directory), fetch and use it
        // Otherwise, create the data
        
        // URL to the object store file in the Documents directory
        _storeFileInDocumentsDirectory = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"teams.plist"];
        
        // System file manager
        NSFileManager *fm = [[NSFileManager alloc] init];

        // Check for data...
        if ([fm fileExistsAtPath:[_storeFileInDocumentsDirectory path]]) 
        {
            // Get the data from the plist
            _nflTeams = [NSArray arrayWithContentsOfURL:_storeFileInDocumentsDirectory];
        } 
        else 
        {
            // Create the data
            _nflTeams = [self createTeams];
        }
        
    }
    return self;
}

#pragma mark - Other operations

- (void)saveModel
{
    // Save the array to a plist
    [self.nflTeams writeToURL:_storeFileInDocumentsDirectory atomically:YES];
}

- (NSArray *)createTeams
{
    // Each team will be a dictionary
    // We'll save its team name, and a check mark state (as a number, 0 or 1)
    
    // Temporary data-building structure
    NSMutableArray *teams = [[NSMutableArray alloc] init];
    
    // Add the teams...
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"New England Patriots", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"New York Jets", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Buffalo Bills", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Miami Dolphins", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Cincinnati Bengals", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Pittsburgh Steelers", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Baltimore Ravens", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Cleveland Browns", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Jacksonville Jaguars", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Tennessee Titans", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Indianapolis Colts", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Houston Texans", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"San Diego Chargers", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Denver Broncos", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Oakland Raiders", @"team", [NSNumber numberWithInt:0], @"checked", nil]];
    [teams addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Kansas City Chiefs", @"team", [NSNumber numberWithInt:0], @"checked", nil]];

    return teams;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}















@end
