//
//  Model.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"
#import "CDStack.h"

@interface Model ()
{
    // Private ivar for the Core Data "stack"
    CDStack *_cdStack;
}

@end

@implementation Model {}

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Create a Core Data stack object
        _cdStack = [[CDStack alloc] init];
    }
    return self;
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
 _frc_example = [cdStack frcWithEntityNamed:@"Example" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"exampleAttribute,YES" andSectionNameKeyPath:nil];
 
 return _frc_example;
 }    
 
 */

@end
