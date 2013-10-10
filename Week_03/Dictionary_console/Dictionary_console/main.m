//
//  main.m
//  Dictionary_console
//
//  Created by Peter McIntyre on 2013-10-08.
//  Copyright (c) 2013 pmcintyr. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Immutable dictionary
        
        // Create the dictionary using the 'literal' syntax
        NSDictionary *me = @{@"fname":@"Peter", @"lname":@"McIntyre", @"age":[NSNumber numberWithInt:29]};
        
        // Dump the dictionary
        NSLog(@"\nInfo about me:\n%@", [me description]);

        // Access a specific key-value pair
        NSString *fullName = [NSString stringWithFormat:@"%@ %@", (NSString *)[me objectForKey:@"fname"], (NSString *)[me objectForKey:@"lname"]];
        NSLog(@"\n\nMy full name:\n%@", fullName);        
        
        // Mutable dictionary
        
        // Create the dictionary
        NSMutableDictionary *car = [[NSMutableDictionary alloc] init];
        
        // Add some key-value pairs
        [car setObject:[NSNumber numberWithInt:2010] forKey:@"Year"];
        [car setObject:@"Toyota" forKey:@"Make"];
        [car setObject:@"Camry" forKey:@"Model"];
        [car setObject:@"LE V6" forKey:@"Trim"];
        [car setObject:[NSDate dateWithString:@"2009-12-06 15:20:00 +0500"] forKey:@"Purchase date"];
        
        // Dump the dictionary
        NSLog(@"\n\nMy car, as a dictionary:\n%@", [car description]);
        
        // Access specific key-value pair(s)
        NSLog(@"\n\nMy car, as a string:\n%d %@ %@ %@", [[car objectForKey:@"Year"] intValue], (NSString *)[car objectForKey:@"Make"], (NSString *)[car objectForKey:@"Model"], (NSString *)[car objectForKey:@"Trim"]);
        
    }
    return 0;
}

