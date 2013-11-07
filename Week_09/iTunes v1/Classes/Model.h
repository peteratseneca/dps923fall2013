//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong) NSArray *tvshows;

@property (nonatomic, strong) NSFetchedResultsController *frc_event;

- (id)addNew:(NSString *)entityName;

- (void)saveChanges;

@end
