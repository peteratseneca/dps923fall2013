//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, strong) NSFetchedResultsController *frc_event;
@property (nonatomic, strong) NSFetchedResultsController *frc_artist;
@property (nonatomic, strong) NSFetchedResultsController *frc_album;
@property (nonatomic, strong) NSFetchedResultsController *frc_song;

- (id)addNew:(NSString *)entityName;

- (id)addNewArtist:(NSString *)artistName;
- (id)addNewAlbum:(NSString *)albumName forArtist:(id)artist inGenre:(NSString *)genre released:(NSDate *)releaseDate;
- (id)addNewSong:(NSString *)songName forAlbum:(id)album composedBy:(NSString *)composer inYear:(NSInteger)year;

- (void)saveChanges;

@end
