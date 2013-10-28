//
//  Song.h
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/09/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Album;

@interface Song : NSManagedObject

@property (nonatomic, retain) NSString * composer;
@property (nonatomic, retain) NSString * songName;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) Album *album;

@end
