//
//  SubjectList.h
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubjectList : UITableViewController

// Include a reference to the model
@property (nonatomic, strong) Model *model;

// Also, for convenience, add a declared property for the array
// that will be the data source for the table view
@property (nonatomic, strong) NSArray *subjects;

@end
