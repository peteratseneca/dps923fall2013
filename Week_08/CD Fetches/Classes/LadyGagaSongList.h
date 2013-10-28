//
//  LadyGagaSongList.h
//  CD Fetches
//
//  Created by Peter McIntyre on 2012/09/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LadyGagaSongList : UITableViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSArray *songs;

@end
