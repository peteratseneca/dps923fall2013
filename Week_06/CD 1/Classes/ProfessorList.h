//
//  ProfessorList.h
//  CD One
//
//  Created by Peter McIntyre on 2012/06/28.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfessorList : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Model *model;

@end
