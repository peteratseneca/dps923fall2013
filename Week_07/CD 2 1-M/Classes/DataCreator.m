//
//  DataCreator.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/26.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "DataCreator.h"

@interface DataCreator ()

+ (NSDate *) NewDateFromYear:(int)year month:(int)month day:(int)day;

@end

@implementation DataCreator {}

+ (void)create:(Model *)model
{
    // Will create two artists
    // One artist has one album, with two songs
    // The other artist has two albums, with two and three songs respectively 
    
    // Add an artist, album, song
    
    NSManagedObject *artist = [model addNewArtist:@"B.o.B"];
    
    NSManagedObject *album = [model addNewAlbum:@"The Adventures of Bobby Ray" forArtist:artist inGenre:@"Pop" released:[self NewDateFromYear:2010 month:7 day:15]];
    
    NSManagedObject *song1 = [model addNewSong:@"Nothin' On You" forAlbum:album composedBy:@"Bobby Ray Simmons, Peter Hernandez, Philip Lawrence, Ari Levine" inYear:2010];

    NSManagedObject *song2 = [model addNewSong:@"Airplanes" forAlbum:album composedBy:@"Jeremy Dussolliet, Justin Franks, Alexander Grant, Bobby Simmons, Tim Sommers" inYear:2010];
    
    // Save
    [model saveChanges];
    
    // Continue by creating more objects 
    
    artist = nil;
    artist = [model addNewArtist:@"Aerosmith"];
    
    album = nil;
    album = [model addNewAlbum:@"Big Ones" forArtist:artist inGenre:@"Rock" released:[self NewDateFromYear:1994 month:11 day:15]];
    
    song1 = nil;
    song1 = [model addNewSong:@"Amazing" forAlbum:album composedBy:@"Steven Tyler, Richie Supa" inYear:1993];
    
    song2 = nil;
    song2 = [model addNewSong:@"Janie's Got A Gun" forAlbum:album composedBy:@"Steven Tyler, Tom Hamilton" inYear:1989];
    
    NSManagedObject *song3 = [model addNewSong:@"Dude (Looks Like A Lady)" forAlbum:album composedBy:@"Steven Tyler, Joe Perry, Desmond Child" inYear:1989];

    // Save
    [model saveChanges];

    // Continue by creating more objects 

    album = nil;
    album = [model addNewAlbum:@"Toys in the Attic" forArtist:artist inGenre:@"Rock" released:[self NewDateFromYear:1975 month:5 day:1]];
    
    song1 = nil;
    song1 = [model addNewSong:@"Walk This Way" forAlbum:album composedBy:@"Steven Tyler, Joe Perry" inYear:1975];
    
    song2 = nil;
    song2 = [model addNewSong:@"Sweet Emotion" forAlbum:album composedBy:@"Steven Tyler, Tom Hamilton" inYear:1975];
    
    song3 = nil;
    
    // Save
    [model saveChanges];

}

+ (NSDate *) NewDateFromYear:(int)year month:(int)month day:(int)day {
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
