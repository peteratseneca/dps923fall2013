//
//  TopicList.h
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicEdit.h"

@interface TopicList : UITableViewController <NSFetchedResultsControllerDelegate, EditTopicDelegate>

@property (nonatomic, strong) Model *model;

@end
