//
//  AppList.h
//  CD 4 M-M +
//
//  Created by Peter McIntyre on 2012/08/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppEdit.h"

@interface AppList : UITableViewController <NSFetchedResultsControllerDelegate, EditAppDelegate>

@property (nonatomic, strong) Model *model;
// In this table view, we want to use "section titles"
@property (nonatomic, strong) NSArray *sectionTitles;

@end
