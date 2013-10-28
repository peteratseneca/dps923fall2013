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
    // Topics Topics Topics Topics Topics Topics Topics Topics Topics Topics
    // Topics Topics Topics Topics Topics Topics Topics Topics Topics Topics
    // Topics Topics Topics Topics Topics Topics Topics Topics Topics Topics

    // Create objects
    NSManagedObject *t01 = [model addNewTopic:@"Foundation" withDescription:@"Foundation kit" andNumber:1];
    NSManagedObject *t02 = [model addNewTopic:@"Views and UI controls" withDescription:@"View objects, user interface controls (button, text field, label, etc.)" andNumber:2];
    NSManagedObject *t03 = [model addNewTopic:@"Keyboard" withDescription:@"Handling the on-screen keyboard, when used with a text field or text view" andNumber:3];
    NSManagedObject *t04 = [model addNewTopic:@"Dates & times" withDescription:@"Displaying and handling dates and times" andNumber:4];
    NSManagedObject *t05 = [model addNewTopic:@"Collections" withDescription:@"Array or dictionary collections" andNumber:5];
    NSManagedObject *t06 = [model addNewTopic:@"Multi-select UI" withDescription:@"Multi-select in a picker or table view" andNumber:6];
    NSManagedObject *t07 = [model addNewTopic:@"PLIST read or write" withDescription:@"Using a PLIST as a data source or for persistence" andNumber:7];
    NSManagedObject *t08 = [model addNewTopic:@"Table view" withDescription:@"Using a table view" andNumber:8];
    NSManagedObject *t09 = [model addNewTopic:@"Table view edit" withDescription:@"Add, delete, move row in a table view" andNumber:9];
    NSManagedObject *t10 = [model addNewTopic:@"Delegate for UI object" withDescription:@"Delegate use for a user interface object (like a table view)" andNumber:10];
    
    NSManagedObject *t20 = [model addNewTopic:@"Data created at first launch" withDescription:@"Data was created at the app's first launch, programmatically, or from a bundle file" andNumber:20];
    
    // Save
    [model saveChanges];
    
    // Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps
    // Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps
    // Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps Apps
    
    // Create objects
    NSManagedObject *a3 = [model addNewApp:@"App Struct" withTheme:@"Shows the iOS app structure" sequence:3 inWeek:1];
    // For the new App object, add the appropriate collection of Topic objects
    [a3 setValue:[NSSet setWithObjects:t01, t02, nil] forKey:@"topics"];
    
    NSManagedObject *a4 = [model addNewApp:@"Hello" withTheme:@"Text field, button, label" sequence:4 inWeek:1];
    [a4 setValue:[NSSet setWithObjects:t01, t02, t03, nil] forKey:@"topics"];

    // Save
    [model saveChanges];
    
    // Clean up to suppress compiler warnings
    a3 = nil, a4 = nil;

    // More objects
    NSManagedObject *a1 = [model addNewApp:@"Convert" withTheme:@"Number-string conversions" sequence:1 inWeek:2];
    [a1 setValue:[NSSet setWithObjects:t01, t02, nil] forKey:@"topics"];
    
    NSManagedObject *a2 = [model addNewApp:@"View Shift" withTheme:@"Text fields, keyboard shift" sequence:2 inWeek:2];
    [a2 setValue:[NSSet setWithObjects:t02, t03, nil] forKey:@"topics"];
    
    a3 = [model addNewApp:@"Text View" withTheme:@"Notepad editor, text view" sequence:3 inWeek:2];
    [a3 setValue:[NSSet setWithObjects:t02, t03, nil] forKey:@"topics"];
    
    a4 = [model addNewApp:@"Array" withTheme:@"List of BSD 1 courses" sequence:4 inWeek:2];
    [a4 setValue:[NSSet setWithObjects:t02, t05, t20, nil] forKey:@"topics"];
    
    NSManagedObject *a5 = [model addNewApp:@"Array To Do" withTheme:@"Add 'to do' items to array" sequence:5 inWeek:2];
    [a5 setValue:[NSSet setWithObjects:t02, t03, t05, nil] forKey:@"topics"];
    
    NSManagedObject *a6 = [model addNewApp:@"Dictionary" withTheme:@"Personal (student) info" sequence:6 inWeek:2];
    [a6 setValue:[NSSet setWithObjects:t02, t03, t05, nil] forKey:@"topics"];
    
    NSManagedObject *a7 = [model addNewApp:@"Picker" withTheme:@"List of Ontario communities" sequence:7 inWeek:2];
    [a7 setValue:[NSSet setWithObjects:t02, t05, t10, t20, nil] forKey:@"topics"];
    
    NSManagedObject *a8 = [model addNewApp:@"Picker Date" withTheme:@"Working with dates" sequence:8 inWeek:2];
    [a8 setValue:[NSSet setWithObjects:t02, t04, t05, nil] forKey:@"topics"];
    
    NSManagedObject *a9 = [model addNewApp:@"Picker Multi" withTheme:@"Pizza, multi-column picker" sequence:9 inWeek:2];
    [a9 setValue:[NSSet setWithObjects:t02, t05, t06, t10, nil] forKey:@"topics"];
    
    // Save
    [model saveChanges];
    
    // Clean up to suppress compiler warnings
    a1 = nil, a2 = nil, a3 = nil, a4 = nil, a5 = nil, a6 = nil, a7 = nil, a8 = nil, a9 = nil;
    
    // More objects
    a1 = [model addNewApp:@"Table Single" withTheme:@"Favourite colour, single-selection" sequence:1 inWeek:3];
    [a1 setValue:[NSSet setWithObjects:t02, t05, t08, t10, t20, nil] forKey:@"topics"];
    
    a2 = [model addNewApp:@"Table Multi" withTheme:@"Favourite colour(s), multi-selection" sequence:2 inWeek:3];
    [a2 setValue:[NSSet setWithObjects:t02, t05, t06, t08, t10, t20, nil] forKey:@"topics"];
    
    a3 = [model addNewApp:@"Table Save" withTheme:@"NFL teams, multi-selection, logos" sequence:3 inWeek:3];
    [a3 setValue:[NSSet setWithObjects:t02, t05, t06, t07, t08, t10, t20, nil] forKey:@"topics"];
    
    // Save
    [model saveChanges];
    
    // Clean up to suppress compiler warnings
    a1 = nil, a2 = nil, a3 = nil;

    // Clean up to suppress compiler warnings
    t01 = nil, t02 = nil, t03 = nil, t04 = nil, t05 = nil, t06 = nil, t07 = nil, t08 = nil, t09 = nil, t10 = nil;
    t20 = nil;

}

@end
