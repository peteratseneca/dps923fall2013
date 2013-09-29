//
//  SubjectDetail.m
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SubjectDetail.h"

@interface SubjectDetail ()

@end

@implementation SubjectDetail {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the user interface
    self.tvSubjectName.text = [self.subject valueForKey:@"Subject Name"];
    self.tvSubjectDescription.text = [self.subject valueForKey:@"Description"];
}

- (void)viewDidUnload
{
    [self setTvSubjectName:nil];
    [self setTvSubjectDescription:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get a reference to the destination view controller, which is a nav controller
    UINavigationController *nav = segue.destinationViewController;
    // Then, get a reference to the subject outline view controller
    SubjectOutline *nextVC = (SubjectOutline *)nav.topViewController;
    
    // Configure it
    nextVC.title = self.title;
    nextVC.delegate = self;
    nextVC.url = [self.subject valueForKey:@"Subject Outline URL"];
}

#pragma mark - Delegate methods

- (void)DismissController:(id)controller
{
    [controller dismissModalViewControllerAnimated:YES];
}

@end
