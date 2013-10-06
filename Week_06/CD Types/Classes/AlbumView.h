//
//  AlbumView.h
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumView : UIViewController

// Data for the controller
@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumName;
@property (weak, nonatomic) IBOutlet UILabel *lblArtistName;
@property (weak, nonatomic) IBOutlet UILabel *lblReleaseDate;
@property (weak, nonatomic) IBOutlet UILabel *lblMinutes;
@property (weak, nonatomic) IBOutlet UILabel *lblSellPrice;
@property (weak, nonatomic) IBOutlet UIImageView *ivAlbumImage;

@end
