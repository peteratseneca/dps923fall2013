//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"
#import "Album.h"
#import "Song.h"

@interface Model : NSObject

// Added these fetched results controllers, for the App and Topic entities

- (id)addNew:(NSString *)entityName;

// Custom methods to create new managed objects

- (void)saveChanges;

// General-purpose data fetcher
- (NSArray *)fetchDataForEntityNamed:(NSString *)entityName withPredicateFormat:(NSString *)predicate predicateObject:(id)predicateObject sortDescriptors:(NSString *)sortDescriptors;

@end
