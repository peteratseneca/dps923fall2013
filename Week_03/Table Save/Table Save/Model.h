//
//  Model.h
//  Table Save
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong) NSArray *nflTeams;

// Save the model object
- (void)saveModel;

@end
