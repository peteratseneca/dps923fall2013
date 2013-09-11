//
//  main.m
//  Strings
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

// NEW CODE
// Function prototype declaration
void doSomething(NSString *s);

int main(int argc, const char * argv[])
{
    // @autoreleasepool supports Cocoa's reference-counted memory management scheme

    @autoreleasepool {
        
        // BEGIN - our code - get familiar with strings and numbers
        
        // As we get familiar, we will send the results to the debug console
        // String format specifiers, quick reference: 
        // %d for integers (or %ld for long integers)
        // %f for floating points and doubles
        // %@ for Cocoa strings
        
        // For complete coverage of format specifiers, see this Apple reference doc
        // http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
        
        // Two kinds of strings are available:
        // NSString - immutable - cannot be changed after initialization
        // NSMutableString - can be changed after initialization
        
        // Skim/read the developer documentation 
        
        // Add a @ prefix to a quoted string to identify it as a Cocoa NSString 
        // If you don't add the @ prefix, it will be treated as a C string (i.e. a char array)
        
        // Notice that you can get a new line with the \n syntax 
        
        // Creating a string - many options are available
        // Direct assignment
        // Method "stringWithString:"
        // Method "stringWithFormat:"
        // Method "stringByAppendingString:"
        
        // Simple and easy - direct assignment
        NSString *string01 = @"Hello, world!";
        NSLog(@"string01 - %@\n\n", string01);
        
        // Creating a string with variable information
        NSInteger myAge = 25;
        NSLog(@"myage - %ld\n\n", myAge);
        
        NSString *myAgeString = [NSString stringWithFormat:@"Value is %ld", (long)myAge];
        NSLog(@"myAgeString - %@\n\n", myAgeString);
        
        // String combining or concatenation
        // + stringWithFormat is your friend
        NSString *string02 = @"quick brown";
        NSString *string03 = @"lazy dog";
        NSInteger jumps = 4;
        
        NSString *stringConcat1 = [NSString stringWithFormat:@"The %@ fox jumped over the %@ %ld %@ ", string02, string03, jumps, @"times"];
        NSLog(@"stringConcat1 - %@\n\n", stringConcat1);
        
        NSString *string04 = @"Beginning of sentence";
        NSString *stringConcat2 = [string04 stringByAppendingString:@", and end of sentence"];
        NSLog(@"stringconcat2 - %@\n\n", stringConcat2);
        
        // String length
        NSLog(@"stringConcat1 has %lu characters", [stringConcat1 length]);
        NSLog(@"stringConcat2 has %lu characters\n\n", [stringConcat2 length]);
        
        // Comparing strings
        
        NSString *string05 = @"Objective-C programming";
        NSString *string06 = @"watching television";
        NSString *string07 = @"Objective-C programming";
        
        // The answers, as BOOL (typedef signed char, 0 or 1)
        NSLog(@"string05 == string07 ? - %d", [string05 isEqualToString:string06]);
        NSLog(@"string05 == string07 ? - %d\n\n", [string05 isEqualToString:string07]);
        // The answers, as strings
        NSLog(@"string05 == string06 ? - %@", [string05 isEqualToString:string06] ? @"yes" : @"no");
        NSLog(@"string05 == string06 ? - %@\n\n", [string05 isEqualToString:string07] ? @"yes" : @"no");
        
        // Mutable (changeable) strings
        
        // Suggested way to initialize a mutable string
        NSMutableString *string08 = [NSMutableString stringWithString:@"initial text"];
        // Appending (other methods are available)
        [string08 appendString:@", and more text"];
        
        NSLog(@"mutable string08 - %@", string08);
        
        // Mutability
        NSMutableString *string09 = [NSMutableString stringWithString:@""];
        NSLog(@"mutable string09 before - %@\n\n", string09);
        
        // Now, change its value
        [string09 setString:@"was empty, now has this text"];
        NSLog(@"mutable string09 after - %@\n\n", string09);
        
        // Replace some of the characters in string09
        // NSRange is a C struct...
        // http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Miscellaneous/Foundation_DataTypes/Reference/reference.html
        // You can use NSMakeRange to conveniently make a range struct
        [string09 replaceCharactersInRange:NSMakeRange(0, 9) withString:@"WAS EMPTY"];
        NSLog(@"mutable string09 after - %@\n\n", string09);
        
        // Numbers
        // A constant with decimal places is usually a double
        // To make it a float, add the "f" character suffix
        
        int numInt = 35;
        float numFlt = 3.14159f;
        double numDbl = 489.121254387;
        
        NSLog(@"my numbers - %d, %1.2f, %1.4f\n\n", numInt, numFlt, numDbl);
        
        // Comparing numbers
        NSLog(@"int == float ? - %@", numInt == numFlt ? @"yes" : @"no");
        NSLog(@"int > float ? - %@", numInt > numFlt ? @"yes" : @"no");
        NSLog(@"float < double ? - %@\n\n", numFlt < numDbl ? @"yes" : @"no");
        
        // Should you use floats or doubles?
        // Doubles
        
        // Converting strings into numbers... Why do this? 
        // Many of the UI objects fields (e.g. UILabel, UITextField) are based on strings
        
        // First, create the strings
        NSString *strInt = @"8";
        NSString *floatString = @"2.35";
        NSString *strFlo = [NSString stringWithString:floatString];
        NSString *doubleString = @"5.673";
        NSString *strDou = [NSString stringWithString:doubleString];
        
        // Then, display the strings
        NSLog(@"string to integer - %d", [strInt intValue] / 2);
        NSLog(@"string to float - %f", [strFlo floatValue] / 1.73f);
        NSLog(@"string to double - %f\n\n", [strDou doubleValue] / 2.013);
        
        // More conversions will appear in the "Conversions" example app
        
        // Call the C function that we created ourselves
        doSomething(@"This string was passed to a function");
        
        // END - our code
        
    }
    return 0;
}

// NEW CODE
// Function definition/implementation
void doSomething(NSString *s)
{
    NSLog(@"%@", s);
}
