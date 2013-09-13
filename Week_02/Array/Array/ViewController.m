//
//  ViewController.m
//  Array
//
//  Created by Peter McIntyre on 2012/06/06.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create a mutable string to hold text
    NSMutableString *s = [[NSMutableString alloc] init];
    
    // Go through the array, and read the elements

    for (int i = 0; i < [self.model.courses count]; i++) {
        // Append to the string
        [s appendFormat:@"Element %d - %@\n", i, [[self.model.courses objectAtIndex:i] description]];
    }

    // Show the results in the user interface
    self.tvContent.text = [s description];

}

- (void)viewDidUnload
{
    [self setTvContent:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
