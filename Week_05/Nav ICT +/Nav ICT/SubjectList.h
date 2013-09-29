//
//  SubjectList.h
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectEdit.h"

@interface SubjectList : UITableViewController <EditSubjectDelegate>

@property (nonatomic, strong) Model *model;

@property (nonatomic, strong) NSString *program;
@property (nonatomic, strong) NSArray *subjects;

@end
