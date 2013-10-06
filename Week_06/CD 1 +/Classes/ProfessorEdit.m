//
//  ProfessorEdit.m
//  CD One +
//
//  Created by Peter McIntyre on 2012/07/09.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProfessorEdit.h"

@interface ProfessorEdit ()

@end

@implementation ProfessorEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) {
        // Cast to a dictionary
        NSDictionary *d = (NSDictionary *)self.detailItem;
        self.tfFullName.text = [d valueForKey:@"fullName"];
        self.tfOffice.text = [d valueForKey:@"office"];
        self.tfEmail.text = [d valueForKey:@"email"];
        self.tfWebSite.text = [d valueForKey:@"webSite"];
    }
}

- (void)viewDidUnload
{
    [self setTfFullName:nil];
    [self setTfOffice:nil];
    [self setTfEmail:nil];
    [self setTfWebSite:nil];
    [self setTvErrors:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (IBAction)cancel:(id)sender 
{
    // Call the delegate, pass in nil
    [self.delegate EditProfessorController:self didEditItem:nil];
}

- (IBAction)save:(id)sender 
{
    // Dismiss the keyboard
    [[self view] endEditing:NO];

    // Do some data validation; all fields need values
    self.tvErrors.text = @"";

    if ([self.tfFullName.text length] == 0) 
    {
        self.tvErrors.text = @"Professor's full name is required\n";
        [self.tfFullName resignFirstResponder];
    }

    if ([self.tfOffice.text length] == 0) 
    {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Office location is required\n", self.tvErrors.text];
        [self.tfOffice resignFirstResponder];
    }

    if ([self.tfEmail.text length] == 0) 
    {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Email address is required\n", self.tvErrors.text];
        [self.tfEmail resignFirstResponder];
    }

    if ([self.tfWebSite.text length] == 0) 
    {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Web site address is required", self.tvErrors.text];
        [self.tfWebSite resignFirstResponder];
    }

    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.tvErrors.text length] == 0) 
    {
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfFullName.text, @"fullName", self.tfOffice.text, @"office", self.tfEmail.text, @"email", self.tfWebSite.text, @"webSite", nil];
        
        [self.delegate EditProfessorController:self didEditItem:d];
    }
}

#pragma mark - Text field delegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
