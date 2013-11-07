//
//  Rating.h
//  Ratings good
//
//  Created by Peter McIntyre on 2012/11/20.
//  Copyright (c) 2012 Peter McIntyre. All rights reserved.
//

/*
 {
 "Rank": 1,
 "Program Name": "NCIS",
 "Network": "CBS",
 "Viewers": 21748000
 }
 */

// Class that models a "rating" object from the web service

#import <Foundation/Foundation.h>

@interface Rating : NSObject

@property (nonatomic) NSInteger rank;
@property (nonatomic, strong) NSString *programName;
@property (nonatomic, strong) NSString *network;
@property (nonatomic) NSInteger viewers;

// Designated initializer
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
