//
//  EventList.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventList : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Model *model;

- (IBAction)addEvent:(id)sender;

@end
