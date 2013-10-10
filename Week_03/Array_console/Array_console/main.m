//
//  main.m
//  Array_console
//
//  Created by Peter McIntyre on 2013-10-08.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        // Immutable array
        
        // Create the array using the 'literal' syntax
        NSArray *courses = @[@"BTP100", @"BTB110", @"BTO120", @"BTO130", @"BTC140"];

        // Dump the array
        NSLog(@"\nUsing the array's 'description' method:\n%@", [courses description]);

        // Looping throught the collection
        NSLog(@"\n\nLooping through the collection:");
        for (int i = 1; i < [courses count]; i++) {
            NSLog(@"\n%@", [courses objectAtIndex:i]);
        }
        
        // Using 'fast enumeration'
        NSLog(@"\n\nUsing 'fast enumeration':");
        for (NSString *course in courses) {
            NSLog(@"\n%@", course);
        }
        
        // Mutable array
        
        // Create a mutable array
        NSMutableArray *temperatures = [[NSMutableArray alloc] init];
        
        // Add some items
        // Array elements must be objects, so we
        // must wrap the int in an NSNumber
        [temperatures addObject:[NSNumber numberWithInt:22]];
        [temperatures addObject:[NSNumber numberWithInt:18]];
        [temperatures addObject:[NSNumber numberWithInt:19]];
        
        // Dump the array
        NSLog(@"\n\nTemperatures:\n%@", [temperatures description]);
        
        // Average temperature
        int temps = 0;
        for (int i = 0; i < [temperatures count]; i++) {
            temps += [[temperatures objectAtIndex:i] intValue];
        }
        // Remember in C, must cast one of the ints to the desired type
        double avg = (double)temps / [temperatures count];
        NSLog(@"\n\nAverage temperature was %1.2f", avg);
        
    }
    return 0;
}

