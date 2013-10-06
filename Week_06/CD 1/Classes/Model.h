//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Fetched results controllers
@property (nonatomic, strong) NSFetchedResultsController *frc_event;
@property (nonatomic, strong) NSFetchedResultsController *frc_professor;

// New object factories
- (id)addNew:(NSString *)entityName;
- (id)addNewProfessor:(NSString *)fullName inOffice:(NSString *)office atEmail:(NSString *)email andWebSite:(NSString *)webSite;

// Data lifecycle
- (void)saveChanges;

@end
