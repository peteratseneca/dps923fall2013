//
//  ViewController.m
//  Hello
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTfName:nil];
    [self setLblResult:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)DoSomething:(id)sender 
{
    // Create the result label string
    self.lblResult.text = [NSString stringWithFormat:@"Hello, %@!", self.tfName.text];
    
    // Clear the text field
    self.tfName.text = @"";
    
    // Dismiss the keyboard
    [self.tfName resignFirstResponder];
    
    // If you were using the C# or Java languages, the statement above would look similar to this:
    // this.tfname.resignFirstResponder();
    
}

@end
