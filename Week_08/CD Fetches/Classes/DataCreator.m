//
//  DataCreator.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/26.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "DataCreator.h"

@implementation DataCreator

+ (void)create:(Model *)model
{
    return;
    
    // General approach with only one entity
    // 1. Create and configure new objects
    // 2. Call the model object's saveChanges method
    // 3. Clean up the newly-created objects (i.e. set them to nil)
    
    // General approach with two related entities (assuming a to-many relationship)
    // 1. Create and configure new objects on the to-many side of the relationship
    // 2. saveChanges
    // 3. Create and configure new objects on the other side of the relationships
    //    As you configure these new objects, add related objects to its collection property
    // 4. saveChanges
    // 5. Clean up all newly-created objects
    
}

@end
