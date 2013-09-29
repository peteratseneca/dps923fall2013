//
//  ProgramList.h
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramList : UITableViewController

// This controller needs only one reference, to the model
@property (nonatomic, strong) Model *model;

@end
