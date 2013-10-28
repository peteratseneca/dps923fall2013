//
//  TopicAppsEdit.h
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/23.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// See the protocol definition below
@protocol EditTopicAppsDelegate;

@interface TopicAppsEdit : UITableViewController <NSFetchedResultsControllerDelegate>

// This class needs a delegate property
@property (nonatomic, assign) id <EditTopicAppsDelegate> delegate;

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) Topic *topic;

// User operations
- (IBAction)done:(id)sender;

@end



@protocol EditTopicAppsDelegate <NSObject>

// Although we are not passing back an object, let's use the same pattern
// That way, your thought pattern on editing is consistent

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditTopicAppsController:(id)controller didEditItem:(id)item;

@end
