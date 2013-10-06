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
#import "ImageToDataTransformer.h"

@interface Model ()
{
    // Core Data stack (private instance variable)
    CDStack *_cdStack;
}

// Private method
- (NSURL *)applicationDocumentsDirectory;

@end

@implementation Model {}

#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Check whether the app is being launched for the first time
        // If yes, check if there's an object store file in the app bundle
        // If yes, copy the object store file to the Documents directory
        // If no, create some new data if you need to
        
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

#pragma mark - Managed object maintenance

- (id)addNew:(NSString *)entityName
{
    // Create and return the new managed object
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_cdStack.managedObjectContext];
}

// Convenience method, customized to the entity's design
- (id)addNewProfessor:(NSString *)fullName inOffice:(NSString *)office atEmail:(NSString *)email andWebSite:(NSString *)webSite
{
    NSManagedObject *p = [self addNew:@"Professor"];
    [p setValue:fullName forKey:@"fullName"];
    [p setValue:office forKey:@"office"];
    [p setValue:email forKey:@"email"];
    [p setValue:webSite forKey:@"webSite"];
    
    return p;
}

- (id)addNewAlbum:(NSString *)albumName withCoverArt:(UIImage *)albumImage byArtist:(NSString *)artistName releaseOn:(NSDate *)releaseDate sellingFor:(double)sellPrice lengthInMinutes:(int)minutes
{
    NSManagedObject *a = [self addNew:@"Album"];
    
    // Strings
    [a setValue:albumName forKey:@"albumName"];
    [a setValue:artistName forKey:@"artistName"];
    
    // Date
    [a setValue:releaseDate forKey:@"releaseDate"];
    
    // Numbers
    [a setValue:[NSNumber numberWithInt:minutes] forKey:@"minutes"];
    [a setValue:[NSNumber numberWithDouble:sellPrice] forKey:@"sellPrice"];
    
    // Image
    [a setValue:albumImage forKey:@"albumImage"];
    
    return a;
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

// Use this as a template... copy it, paste it (into your Model class), and then edit it
- (NSFetchedResultsController *)frc_album
{
    // If the frc is already configured, simply return it
    if (_frc_album) return _frc_album;
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_album = [_cdStack frcWithEntityNamed:@"Album" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"albumName,YES" andSectionNameKeyPath:nil];
    
    return _frc_album;
}    

/*
 
 #pragma mark - Fetched results controller (custom getter) creation template
 
 // Use this as a template... copy it, paste it (into your Model class), and then edit it
 - (NSFetchedResultsController *)frc_example
 {
 // If the frc is already configured, simply return it
 if (_frc_example) return _frc_example;
 
 // Otherwise, create a new frc, and set it as the property (and return it below)
 _frc_example = [cdStack frcWithEntityNamed:@"Example" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"exampleAttribute,YES" andSectionNameKeyPath:nil];
 
 return _frc_example;
 }    
 
 */

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
