//
//  DataCreator.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/26.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "DataCreator.h"

@interface DataCreator ()

@end

@implementation DataCreator {}

+ (void)create:(Model *)model
{
    // Add your app-specific code here to create new data
    
    // Save
    [model saveChanges];

}

@end
