//
//  MasterViewController.h
//  MD with CD
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

// Object which manages results from a fetch request for a table view controller
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

// Reference to the managed object context
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
