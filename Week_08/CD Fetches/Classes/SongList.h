//
//  SongList.h
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/09/04.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongList : UITableViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSArray *songs;

@end
