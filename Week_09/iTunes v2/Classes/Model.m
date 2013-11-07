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
    
    // Results search string
    NSString *_resultsSearchUrl;
}

- (NSURL *)applicationDocumentsDirectory;

@end

@implementation Model

@synthesize frc_event = _frc_event;

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

- (void)searchMediaByArtist:(NSString *)artist album:(NSString *)album song:(NSString *)song
{
    // Create a base URL
    NSMutableString *baseUrl = [NSMutableString stringWithString:@"https://itunes.apple.com/search?media=music&term="];

    // Add the artist string...
    if (artist.length > 0)
    {
        [baseUrl appendString:artist];
        if (album.length > 0 | song.length > 0) [baseUrl appendString:@" "];
    }
    
    // Add the album string...
    if (album.length > 0)
    {
        [baseUrl appendString:album];
        if (song.length > 0) [baseUrl appendString:@" "];
    }

    // Add the song string...
    if (song.length > 0) [baseUrl appendString:song];

    // Replace spaces with plus signs, as required by the API
    [baseUrl setString:[baseUrl stringByReplacingOccurrencesOfString:@" " withString:@"+"]];

    // Add extra search parameters to improve the quality of results
    if (album.length == 0 & song.length == 0) [baseUrl setString:[baseUrl stringByReplacingOccurrencesOfString:@"media=music" withString:@"entity=allArtist&attribute=allArtistTerm"]];
    if (album.length > 0 & song.length == 0) [baseUrl appendString:@"&entity=album"];
    if (song.length > 0) [baseUrl appendString:@"&entity=song"];

    // Save the URL
    _resultsSearchUrl = [baseUrl description];
    
    NSLog(@"\n%@", _resultsSearchUrl);
    
    // Clear the existing collection
    self.results = nil;
    
    // Then, access the collection, which will cause the search to be executed
    // Notice the cast to void; this is how you can access the value and avoid assigning it
    (void)self.results;
}

- (NSArray *)results
{
    // If we have the data, return it
    if (_results) return _results;
    
    // Otherwise, fetch the data
    _results = [[NSArray alloc] init];
    
    // Create and configure a request object
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_resultsSearchUrl]];
    
    // Create and configure an AFNetworking JSON request operation
    // Notice that the initializer uses "blocks" for the success and failure arguments
    
    // Reference the app's network activity indicator in the status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
     {
         _results = (NSArray *)[JSON objectForKey:@"results"];
         
         // Then, post a notification, so that a controller object can request the results
         [[NSNotificationCenter defaultCenter] postNotificationName:@"ResultsSearchSuccessful" object:nil];
         
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
    
    return _results;
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
