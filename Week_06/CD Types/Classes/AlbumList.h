//
//  AlbumList.h
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumList : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Model *model;

@end
