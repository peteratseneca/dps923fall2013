//
//  Model.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"
#import "CDStack.h"
#import "DataCreator.h"

@interface Model ()
{
    // Core Data stack
    CDStack *_cdStack;
}

- (NSURL *)applicationDocumentsDirectory;

@end

@implementation Model {}

#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Is this the app's first launch? (object store file does not exist) 
        // If yes, then does the app include starter data (will be in the app bundle) 
        // If yes, then copy the store file from the bundle to the Documents directory
        // Otherwise, will have to create some new data (after the stack is initialized)
        
        // URL to the object store file in the app bundle
        NSURL *storeFileInBundle = [[NSBundle mainBundle] URLForResource:@"ObjectStore" withExtension:@"sqlite"];
        
        // URL to the object store file in the Documents directory
        NSURL *storeFileInDocumentsDirectory = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ObjectStore.sqlite"];
        
        // System file manager
        NSFileManager *fm = [[NSFileManager alloc] init];
        
        // Check whether this is the first launch of the app
        BOOL isFirstLaunch = ![fm fileExistsAtPath:[storeFileInDocumentsDirectory path]];
        
        // Check whether the app is supplied with starter data in the app bundle
        BOOL hasStarterData = [fm fileExistsAtPath:[storeFileInBundle path]];
        
        if (isFirstLaunch)
        {
            if (hasStarterData)
            {
                // Use the supplied starter data
                [fm copyItemAtURL:storeFileInBundle toURL:storeFileInDocumentsDirectory error:nil];
                // Create a Core Data stack object after copying file
                _cdStack = [[CDStack alloc] init];
            }
            else
            {
                // Create a Core Data stack object before creating new data
                _cdStack = [[CDStack alloc] init];
                // Create some new data
                [DataCreator create:self];
            }
        }
        else
        {
            _cdStack = [[CDStack alloc] init];
        }
    }
    return self;
}

#pragma mark - Network fetched results

- (NSArray *)tvshows
{
    // If we have the data, return it
    if (_tvshows) return _tvshows;
    
    // Otherwise, fetch the data
    _tvshows = [[NSArray alloc] init];
    
    // Search string alternatives...
    
    NSString *search = nil;
    //search = @"https://itunes.apple.com/search?term=NCIS&country=ca&media=tvShow&limit=10";
    //search = @"https://itunes.apple.com/lookup?id=157766275&entity=tvEpisode&limit=10&sort=recent";
    search = @"https://itunes.apple.com/search?term=blue+bloods&entity=tvEpisode&limit=10&sort=recent";
    
    // Create and configure a request object
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:search]];
    
    // Create and configure an AFNetworking JSON request operation
    // Notice that the initializer uses "blocks" for the success and failure arguments
    
	// Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    AFJSONRequestOperation *operation =
        [AFJSONRequestOperation JSONRequestOperationWithRequest:request
            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
            {
                _tvshows = [JSON objectForKey:@"results"];

                // Then, post a notification, so that a controller object can request the results
                [[NSNotificationCenter defaultCenter] postNotificationName:@"MediaLoadedSuccessfully" object:nil];

                // Reference the app's network activity indicator in the status bar
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            }
            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
            {
                NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
                // Reference the app's network activity indicator in the status bar
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            }
         ];
    
    // Start the operation
    [operation start];

    
    return _tvshows;
}

#pragma mark - Managed object maintenance

- (id)addNew:(NSString *)entityName
{
    // Create and return the new managed object
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_cdStack.managedObjectContext];
}

- (void)saveChanges
{
    [_cdStack saveContext];
}

#pragma mark - Fetched results controller - Events

// Use this as a template... copy it, paste it (into your Model class), and then edit it
- (NSFetchedResultsController *)frc_event
{
    // If the frc is already configured, simply return it
    if (_frc_event) return _frc_event;
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_event = [_cdStack frcWithEntityNamed:@"Event" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"timeStamp,NO" andSectionNameKeyPath:nil];
    
    return _frc_event;
}

/*
 
 #pragma mark - Fetched results controller (custom getter) creation template
 
 // Use this as a template... copy it, paste it (into your Model class), and then edit it
 - (NSFetchedResultsController *)frc_example
 {
 // If the frc is already configured, simply return it
 if (_frc_example) return _frc_example;
 
 // Otherwise, create a new frc, and set it as the property (and return it below)
 _frc_example = [_cdStack frcWithEntityNamed:@"Example" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"exampleAttribute,YES" andSectionNameKeyPath:nil];
 
 return _frc_example;
 }    
 
 */

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
