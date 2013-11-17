//
//  ProgramView.h
//  Graded Work
//
//  Created by Peter McIntyre on 2013-11-17.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramView : UIViewController

@property (nonatomic, strong) NSDictionary *program;

@property (weak, nonatomic) IBOutlet UILabel *lblCode;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblCredential;
@property (weak, nonatomic) IBOutlet UILabel *lblSemesters;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;

@end
