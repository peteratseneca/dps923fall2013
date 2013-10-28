//
//  App.h
//  CD 4 M-M
//
//  Created by Peter McIntyre on 2012/08/21.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface App : NSManagedObject

@property (nonatomic, retain) NSString * appName;
@property (nonatomic, retain) NSNumber * sequence;
@property (nonatomic, retain) NSString * theme;
@property (nonatomic, retain) NSNumber * week;
@property (nonatomic, retain) NSSet *topics;
@end

@interface App (CoreDataGeneratedAccessors)

- (void)addTopicsObject:(NSManagedObject *)value;
- (void)removeTopicsObject:(NSManagedObject *)value;
- (void)addTopics:(NSSet *)values;
- (void)removeTopics:(NSSet *)values;

@end
