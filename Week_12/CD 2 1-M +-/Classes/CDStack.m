//
//  CDStack.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "CDStack.h"

@interface CDStack ()

- (NSURL *)applicationDocumentsDirectory;

@end

@implementation CDStack

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

#pragma mark - Core Data stack

// Custom getter
- (NSManagedObjectContext *)managedObjectContext
{
    // If the MOC already exists, simply return it
    if (__managedObjectContext) return __managedObjectContext;
    
    // Create the MOC
    __managedObjectContext = [[NSManagedObjectContext alloc] init];
    
    // Configure it
    if (self.persistentStoreCoordinator) {
        [__managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        return __managedObjectContext;
    } else {
        return nil;
    }
}

// Custom getter
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // If the PSC already exists, simply return it
    if (__persistentStoreCoordinator) return __persistentStoreCoordinator;
    
    // Create the PSC
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    // Get the NSURL to the object store file
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ObjectStore.sqlite"];
    
    // Prepare an error object
    NSError *error = nil;
    
    // Configure the PSC with the object store file
    if ([__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        return __persistentStoreCoordinator;
    } else {
        // This code block will run if there is an error
        NSAssert(NO, @"NSPersistentStoreCoordinator is nil");
        NSLog(@"%@:%s Object store file was not found", [self class], __FUNCTION__);
        NSLog(@"%@, %@", error, [error userInfo]);
        return nil;
    }    
}

// Custom getter
- (NSManagedObjectModel *)managedObjectModel
{
    // If the MOM already exists, simply return it
    if (__managedObjectModel) return __managedObjectModel;
    
    // Get the NSURL to the data model file
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ObjectModel" withExtension:@"momd"];
    
    // Create the MOM
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    // Return the result
    if (__managedObjectModel) {
        return __managedObjectModel;
    } else {
        NSAssert(NO, @"NSManagedObjectModel is nil");
        NSLog(@"%@:%s Object model file was not found", [self class], __FUNCTION__);
        return nil;
    }
}

#pragma mark - Core Data support tasks

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)saveContext
{
    // Create an error object
    NSError *error = nil;
    
    // If there are changes to save, attempt to save them
    if ([self.managedObjectContext hasChanges] && ![self.managedObjectContext save:&error]) {
        
        // This code block will run if there is an error
        NSAssert(NO, @"Unable to save the changes");
        NSLog(@"%@:%s Unable to save the changes", [self class], __FUNCTION__);
        NSLog(@"%@, %@", error, [error userInfo]);
    }
}

#pragma mark - Factory that creates a fetched results controller

// This method will create and return a fully-configured fetched results controller
// Its arguments are simple strings, for entity name, predicate, and sort descriptors
// sortDescriptors can be nil, or a comma-separated list of attribute-boolean (YES or NO) pairs
// After initialization, the code can change the configuration if needed
// Before using it, you must send it the performFetch message

- (NSFetchedResultsController *)frcWithEntityNamed:(NSString *)entityName withPredicateFormat:(NSString *)predicate predicateObject:(id)predicateObject sortDescriptors:(NSString *)sortDescriptors andSectionNameKeyPath:(NSString *)sectionName
{
    // Create the fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // Configure the entity name
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a reasonable number
    [fetchRequest setFetchBatchSize:20];
    
    // Configure the predicate
    if (predicate) [fetchRequest setPredicate:[NSPredicate predicateWithFormat:predicate, predicateObject]];
    
    // Configure the sort descriptors
    if (sortDescriptors) {
        // Create an array to accumulate the sort descriptors
        NSMutableArray *sdArray = [[NSMutableArray alloc] init];
        // Make an array from the passed-in string
        // Examples include...
        // nil
        // attribute1,YES
        // attribute1,YES,attribute2,NO
        // etc.
        NSArray *sdStrings = [sortDescriptors componentsSeparatedByString:@","];
        // Iterate through the array, and make sort descriptor objects
        for (int i = 0; i < [sdStrings count]; i+=2) {
            NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:[sdStrings objectAtIndex:i] ascending:[[sdStrings objectAtIndex:(i + 1)] boolValue]];
            // Add to the sort descriptors array
            [sdArray addObject:sd];
        }
        [fetchRequest setSortDescriptors:sdArray];
    }
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:sectionName cacheName:entityName];
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

@end
