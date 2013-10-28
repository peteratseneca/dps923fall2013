//
//  SongEdit.m
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2012/07/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SongEdit.h"

@interface SongEdit ()
{
    NSMutableArray *_years;
}

@end

@implementation SongEdit {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Initialize the array of years for the picker

    NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [c components:NSYearCalendarUnit fromDate:[NSDate date]];
	NSInteger yearNow = [dc year];
    NSInteger yearNext = yearNow + 1;
    
    _years = [[NSMutableArray alloc] init];
    for (int i = 1900; i <= yearNext; i++) 
    {
        [_years addObject:[NSNumber numberWithInt:i]];
    }
    
    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem) 
    {
        // Cast to a dictionary
        // songName, composer, year
        
        NSDictionary *d = (NSDictionary *)self.detailItem;
        self.tfSongName.text = [d valueForKey:@"songName"];
        self.tfComposer.text = [d valueForKey:@"composer"];
        // Set the picker to this year
        [self.pvYear selectRow:([_years count] - 2) inComponent:0 animated:NO];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Set the picker to this year
    [self.pvYear selectRow:([_years count] - 2) inComponent:0 animated:NO];
}

- (void)viewDidUnload
{
    [self setTfSongName:nil];
    [self setTfComposer:nil];
    [self setTvErrors:nil];
    [self setPvYear:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - Picker view methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_years count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%@", [[_years objectAtIndex:row] description]];
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

- (IBAction)save:(id)sender 
{
    // Do data validation
    self.tvErrors.text = @"";
    
    if ([self.tfSongName.text length] == 0) 
    {
        self.tvErrors.text = @"Song name is required\n";
        [self.tfSongName resignFirstResponder];
    }
    
    if ([self.tfComposer.text length] == 0) {
        self.tvErrors.text = [NSString stringWithFormat:@"%@Composer is required", self.tvErrors.text];
        [self.tfComposer resignFirstResponder];
    }
    
    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.tvErrors.text length] == 0) 
    {
        // Get the selected row number
        NSInteger row = [self.pvYear selectedRowInComponent:0];
        // Get the corresponding year value from the array, as a string
        NSString *year = [[_years objectAtIndex:row] description];

        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = [NSDictionary dictionaryWithObjectsAndKeys:self.tfSongName.text, @"songName", self.tfComposer.text, @"composer", [NSNumber numberWithInt:[year intValue]], @"year", nil];
        
        [self.delegate EditSongController:self didEditItem:d];
    }
}

- (IBAction)cancel:(id)sender 
{
    // Call the delegate, pass in nil
    [self.delegate EditSongController:self didEditItem:nil];
}

@end
