//
//  StaffList.h
//  Search
//
//  Created by Peter McIntyre on 2012/08/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffList : UITableViewController <NSFetchedResultsControllerDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) Model *model;

@end
