//
//  Model.h
//  Dictionary
//
//  Created by Peter McIntyre on 2012/06/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// In a model class, create one or more properties that expose the model's data

@property (nonatomic, copy) NSMutableDictionary *me;

@end
