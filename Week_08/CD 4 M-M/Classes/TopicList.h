//
//  TopicList.h
//  CD 3 M-M
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicList : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Model *model;

@end
