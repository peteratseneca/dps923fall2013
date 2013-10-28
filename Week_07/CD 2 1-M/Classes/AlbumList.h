//
//  AlbumList.h
//  CD Two 1-M
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumList : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *ro;

@end
