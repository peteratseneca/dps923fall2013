//
//  Person.h
//  Search
//
//  Created by Peter McIntyre on 2012/08/24.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * telephone;
@property (nonatomic, retain) NSString * office;
@property (nonatomic, retain) NSString * fullName;

@end
