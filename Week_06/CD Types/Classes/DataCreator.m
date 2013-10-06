//
//  DataCreator.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/26.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "DataCreator.h"

@implementation DataCreator {}

+ (void)create:(Model *)model
{
    // Create objects
    // They get created on (in?) the context object
    // Later, when the saveChanges message is sent, the Core Data infrastructure saves them to the store
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"The E.N.D." ofType:@"png"];
    UIImage *albumImage = [UIImage imageWithContentsOfFile:imagePath];
    NSManagedObject *a1 = [model addNewAlbum:@"The E.N.D." withCoverArt:albumImage byArtist:@"The Black Eyed Peas" releaseOn:[self NewDateFromYear:2009 month:6 day:3] sellingFor:12.99 lengthInMinutes:74];

    imagePath = nil, albumImage = nil;
    imagePath = [[NSBundle mainBundle] pathForResource:@"21" ofType:@"jpg"];
    albumImage = [UIImage imageWithContentsOfFile:imagePath];
    NSManagedObject *a2 = [model addNewAlbum:@"21" withCoverArt:albumImage byArtist:@"Adele" releaseOn:[self NewDateFromYear:2011 month:1 day:19] sellingFor:11.99 lengthInMinutes:49];
    
    imagePath = nil, albumImage = nil;
    imagePath = [[NSBundle mainBundle] pathForResource:@"Mylo Xyloto" ofType:@"jpg"];
    albumImage = [UIImage imageWithContentsOfFile:imagePath];
    NSManagedObject *a3 = [model addNewAlbum:@"Mylo Xyloto" withCoverArt:albumImage byArtist:@"Coldplay" releaseOn:[self NewDateFromYear:2011 month:10 day:24] sellingFor:11.99 lengthInMinutes:45];
    
    imagePath = nil, albumImage = nil;
    imagePath = [[NSBundle mainBundle] pathForResource:@"Ceremonials" ofType:@"png"];
    albumImage = [UIImage imageWithContentsOfFile:imagePath];
    NSManagedObject *a4 = [model addNewAlbum:@"Ceremonials" withCoverArt:albumImage byArtist:@"Florence + The Machine" releaseOn:[self NewDateFromYear:2011 month:10 day:28] sellingFor:12.99 lengthInMinutes:56];
    
    // Save
    [model saveChanges];

    // Clean up to suppress compiler warnings
    a1 = nil, a2=nil, a3=nil, a4=nil;
    
}

+ (NSDate *) NewDateFromYear:(int)year month:(int)month day:(int)day
{
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [[NSDateComponents alloc] init];
	[dc setYear:year];
	[dc setMonth:month];
	[dc setDay:day];
	[dc setHour:0];
	[dc setMinute:0];
	return [c dateFromComponents:dc];
}

@end
