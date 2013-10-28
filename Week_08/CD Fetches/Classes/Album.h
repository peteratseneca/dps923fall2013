//
//  Album.h
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/09/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Artist;
@class Song;

@interface Album : NSManagedObject

@property (nonatomic, retain) NSString * albumName;
@property (nonatomic, retain) NSString * genre;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) Artist *artist;
@property (nonatomic, retain) NSSet *songs;
@end

@interface Album (CoreDataGeneratedAccessors)

- (void)addSongsObject:(Song *)value;
- (void)removeSongsObject:(Song *)value;
- (void)addSongs:(NSSet *)values;
- (void)removeSongs:(NSSet *)values;

@end
