//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "App.h"
#import "Topic.h"

@interface Model : NSObject

// Added these fetched results controllers, for the App and Topic entities
@property (nonatomic, strong) NSFetchedResultsController *frc_app;
@property (nonatomic, strong) NSFetchedResultsController *frc_topic;

- (id)addNew:(NSString *)entityName;

// Custom methods to create new managed objects
- (App *)addNewApp:(NSString *)appName withTheme:(NSString *)theme sequence:(int)sequence inWeek:(int)week;
- (Topic *)addNewTopic:(NSString *)topicName withDescription:(NSString *)topicDescription andNumber:(int)number;

- (void)saveChanges;

@end
