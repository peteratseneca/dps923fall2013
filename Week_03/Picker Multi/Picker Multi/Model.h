//
//  Model.h
//  Picker Multi
//
//  Created by Peter McIntyre on 2012/06/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong) NSArray *allItems;

@property (nonatomic, strong) NSArray *pizzasize;
@property (nonatomic, strong) NSArray *kind;
@property (nonatomic, strong) NSArray *where;

@end
