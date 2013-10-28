//
//  SongView.h
//  CD Two 1-M
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongView : UIViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *ro;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblSongName;
@property (weak, nonatomic) IBOutlet UILabel *lblComposer;
@property (weak, nonatomic) IBOutlet UILabel *lblYear;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumName;
@property (weak, nonatomic) IBOutlet UILabel *lblGenre;
@property (weak, nonatomic) IBOutlet UILabel *lblReleaseDate;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistName;

@end
