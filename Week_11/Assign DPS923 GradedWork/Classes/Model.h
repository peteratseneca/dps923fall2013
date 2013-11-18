//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Web service - Program entity
@property (nonatomic, strong) NSArray *programs;

// Web service - Subject entity
@property (nonatomic, strong) NSArray *subjects;

// frc_event is a placeholder, a template that can be used as a guide
@property (nonatomic, strong) NSFetchedResultsController *frc_event;

- (id)addNew:(NSString *)entityName;

- (void)saveChanges;

@end
