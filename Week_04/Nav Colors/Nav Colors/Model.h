//
//  Model.h
//  Nav Colors
//
//  Created by Peter McIntyre on 2012/01/31.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// All of the data for the app
@property (nonatomic, strong) NSDictionary *colorDict;

// Convenience array that helps build the table view
@property (nonatomic, strong) NSArray *colorNames;

@end
