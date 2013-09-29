//
//  SubjectDetail.h
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubjectOutline.h"

@interface SubjectDetail : UIViewController <OutlineDelegate>

// Reference to the model
@property (nonatomic, strong) Model *model;

// For convenience, add a declared property for the "subject"
// object, so that it can be used to configure the user interface
@property (nonatomic, strong) NSDictionary *subject;

// User interface
@property (weak, nonatomic) IBOutlet UITextView *tvSubjectName;
@property (weak, nonatomic) IBOutlet UITextView *tvSubjectDescription;

@end
