//
//  CDStack.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDStack : NSObject

// Core Data stack
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// Core Data support tasks
- (void)saveContext;

// Fetched results controller factory 
- (NSFetchedResultsController *)frcWithEntityNamed:(NSString *)entityName withPredicateFormat:(NSString *)predicate predicateObject:(id)predicateObject sortDescriptors:(NSString *)sortDescriptors andSectionNameKeyPath:(NSString *)sectionName;

@end
