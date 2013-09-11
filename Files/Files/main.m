//
//  main.m
//  Files
//
//  Created by Peter McIntyre on 2012/06/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    // @autoreleasepool supports Cocoa's reference-counted memory management scheme
    
    @autoreleasepool {
        
        // BEGIN - our code is below
        
        // This code example will read the file system of your Mac
        // It will get the folder and file names of the objects in your home user profile
        
        // For each of these Cocoa types, Option+Click the class name to see some help info
        // Then, click the "Reference" link for full-window reference info
        //   NSFileManager 
        //   NSString 
        //   NSArray
        // In each reference doc, read/skim the Overview, Tasks, and method list 
        
        // Create a file manager
        NSFileManager *fm = [[NSFileManager alloc] init];
        
        // The above statement in C# would be something like...
        // NSFileManager fm = new NSFileManager();
        
        // Create an array to hold the file/folder names 
        // An NSArray instance is immutable (cannot change after creation)
        // The stringByExpandingTildeInPath is a neat trick
        // It returns a string that is the file system path to your home directory
        NSArray *files = [fm contentsOfDirectoryAtPath:[@"~" stringByExpandingTildeInPath] error:nil];

        // Notice the nested messages in the statement above...
        // Instead of the nested message, we could use a string literal, like the following example
        // NSArray *files = [fm contentsOfDirectoryAtPath:@"/users/peter" error:nil];

        // Send to the debug console log
        for (id file in files) 
        {
            // Ignore hidden objects
            if (![file hasPrefix:@"."]) 
            {
                NSLog(@"item: %@", file);
            }		
        }
        
        // The "for" statement above could also be written like the following example
        // for (NSString *file in files)
        
        // END - our code ends
        
    }
    return 0;
}

