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

// Customized managed object creators
- (id)addNewArtist:(NSString *)artistName
{
    NSManagedObject *a = [self addNew:@"Artist"];
    [a setValue:artistName forKey:@"artistName"];
    return a;
}

- (id)addNewAlbum:(NSString *)albumName forArtist:(id)artist inGenre:(NSString *)genre released:(NSDate *)releaseDate
{
    NSManagedObject *a = [self addNew:@"Album"];
    [a setValue:albumName forKey:@"albumName"];
    [a setValue:artist forKey:@"artist"];
    [a setValue:genre forKey:@"genre"];
    [a setValue:releaseDate forKey:@"releaseDate"];
    return a;
}

- (id)addNewSong:(NSString *)songName forAlbum:(id)album composedBy:(NSString *)composer inYear:(NSInteger)year
{
    NSManagedObject *s = [self addNew:@"Song"];
    [s setValue:songName forKey:@"songName"];
    [s setValue:album forKey:@"album"];
    [s setValue:composer forKey:@"composer"];
    [s setValue:[NSNumber numberWithInt:year] forKey:@"year"];
    return s;
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

#pragma mark - Fetched results controller - Artists

// Use this as a template... copy it, paste it (into your Model class), and then edit it
- (NSFetchedResultsController *)frc_artist
{
    // If the frc is already configured, simply return it
    if (_frc_artist) return _frc_artist;
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_artist = [_cdStack frcWithEntityNamed:@"Artist" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"artistName,YES" andSectionNameKeyPath:nil];
    
    return _frc_artist;
}    

#pragma mark - Fetched results controller - Albums

// Use this as a template... copy it, paste it (into your Model class), and then edit it
- (NSFetchedResultsController *)frc_album
{
    // If the frc is already configured, simply return it
    if (_frc_album) return _frc_album;
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_album = [_cdStack frcWithEntityNamed:@"Album" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"albumName,YES" andSectionNameKeyPath:nil];
    
    return _frc_album;
}    

#pragma mark - Fetched results controller - Songs

// Use this as a template... copy it, paste it (into your Model class), and then edit it
- (NSFetchedResultsController *)frc_song
{
    // If the frc is already configured, simply return it
    if (_frc_song) return _frc_song;
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_song = [_cdStack frcWithEntityNamed:@"Song" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"songName,YES" andSectionNameKeyPath:nil];
    
    return _frc_song;
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
