//
//  Topic.h
//  CD 4 M-M
//
//  Created by Peter McIntyre on 2012/08/21.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class App;

@interface Topic : NSManagedObject

@property (nonatomic, retain) NSString * topicDescription;
@property (nonatomic, retain) NSString * topicName;
@property (nonatomic, retain) NSNumber * topicNumber;
@property (nonatomic, retain) NSSet *apps;
@end

@interface Topic (CoreDataGeneratedAccessors)

- (void)addAppsObject:(App *)value;
- (void)removeAppsObject:(App *)value;
- (void)addApps:(NSSet *)values;
- (void)removeApps:(NSSet *)values;

@end
