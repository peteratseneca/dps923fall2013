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

@property (nonatomic, strong) Model *model;

@property (nonatomic, strong) NSDictionary *subject;

@property (weak, nonatomic) IBOutlet UITextView *tvSubjectName;
@property (weak, nonatomic) IBOutlet UITextView *tvSubjectDescription;

@end
