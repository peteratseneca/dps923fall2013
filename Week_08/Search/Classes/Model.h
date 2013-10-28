//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Model : NSObject

@property (nonatomic, strong) NSFetchedResultsController *frc_event;

// Added these fetched results controllers
@property (nonatomic, strong) NSFetchedResultsController *frc_person;

- (id)addNew:(NSString *)entityName;

// Custom methods to create new managed objects

- (void)saveChanges;

@end
