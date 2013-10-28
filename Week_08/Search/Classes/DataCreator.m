//
//  DataCreator.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/26.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "DataCreator.h"

@implementation DataCreator {}

+ (void)create:(Model *)model
{
    // Get the data from the plist file in the bundle
    NSArray *staffList = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"ICTStaff20120824" withExtension:@"plist"]];
    
    // It is an array of dictionaries
    // Each dictionary is an ICT staff member
    
    for (int i = 0; i < [staffList count]; i++) {
        // Get the staff member dictionary
        NSDictionary *s = [staffList objectAtIndex:i];
        // Create a person object
        Person *p = (Person *)[model addNew:@"Person"];
        // Configure the new object
        p.fullName = [s valueForKey:@"Name"];
        p.telephone = [s valueForKey:@"Telephone"];
        p.office = [s valueForKey:@"Office"];
        // Save changes
        [model saveChanges];
    }
    
    return;
}

@end
