//
//  SubjectEdit.m
//  Nav ICT +
//
//  Created by Peter McIntyre on 2012/08/13.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SubjectEdit.h"

@interface SubjectEdit ()

@end

@implementation SubjectEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) {
        // Cast to a dictionary
        NSDictionary *d = (NSDictionary *)self.detailItem;
        self.tfSubjectCode.text = [d valueForKey:@"subjectCode"];
        self.tfSubjectName.text = [d valueForKey:@"subjectName"];
        self.tvDescription.text = [d valueForKey:@"description"];
    }
}

- (void)viewDidUnload
{
    [self setTfSubjectCode:nil];
    [self setTfSubjectName:nil];
    [self setTvDescription:nil];
    [self setTvErrors:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (IBAction)save:(id)sender
{
    // Dismiss the keyboard
    [[self view] endEditing:NO];
    
    // Do some data validation; all fields need a value
    self.tvErrors.text = @"";
    
    if ([self.tfSubjectCode.text length] == 0)
    {
        self.tvErrors.text = @"Subject Code is required\n";
        [self.tfSubjectCode resignFirstResponder];
    }

    if ([self.tfSubjectName.text length] == 0)
    {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Subject Name is required\n", self.tvErrors.text];
        [self.tfSubjectName resignFirstResponder];
    }

    if ([self.tvDescription.text length] == 0)
    {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Description is required\n", self.tvErrors.text];
        [self.tvDescription resignFirstResponder];
    }

    // If there are no errors...
    // Call back to the delegate, and pass the values from the user interface
    
    if ([self.tvErrors.text length] == 0)
    {
        // Make a subject outline URL
        NSString *url = [NSString stringWithFormat:@"https://scs.senecac.on.ca/course/%@", [self.tfSubjectCode.text lowercaseString]];
        
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfSubjectCode.text, @"subjectCode", self.tfSubjectName.text, @"subjectName", self.tvDescription.text, @"description", url, @"subjectOutlineURL", nil];
        
        [self.delegate EditSubjectController:self didEditItem:d];
    }
}

- (IBAction)cancel:(id)sender
{
    // Call back to the delegate with nil
    [self.delegate EditSubjectController:self didEditItem:nil];
}

#pragma mark - Text delegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}

@end
