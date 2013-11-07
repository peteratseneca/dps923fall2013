//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Properties
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSFetchedResultsController *frc_event;

// Methods

- (void)searchMediaByArtist:(NSString *)artist album:(NSString *)album song:(NSString *)song;
- (id)addNew:(NSString *)entityName;
- (void)saveChanges;

@end
