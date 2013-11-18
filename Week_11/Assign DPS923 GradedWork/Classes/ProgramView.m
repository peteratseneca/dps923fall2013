//
//  ProgramView.m
//  Graded Work
//
//  Created by Peter McIntyre on 2013-11-17.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import "ProgramView.h"

@interface ProgramView ()

@end

@implementation ProgramView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lblCode.text = [self.program valueForKey:@"Code"];
    self.lblName.text = [self.program valueForKey:@"Name"];
    self.lblCredential.text = [self.program valueForKey:@"Credential"];
    self.lblSemesters.text = [NSString stringWithFormat:@"Length in semesters: %d", [[self.program valueForKey:@"Semesters"] intValue]];
    self.tvDescription.text = [self.program valueForKey:@"Description"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
