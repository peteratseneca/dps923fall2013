//
//  Model.h
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/02/01.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Array of program codes only
@property (nonatomic, retain) NSArray *programs;

// Return an array of subject code strings which are in a specific program
- (NSArray *)subjectsInProgram:(NSString *)program;

// Return a dictionary of subject details 
- (NSDictionary *)subject:(NSString *)subject;

// Add new object factory
- (id)addNewSubject:(NSString *)subjectCode named:(NSString *)subjectName inProgram:(NSString *)program withDescription:(NSString *)subjectDescription andURL:(NSString *)subjectOutlineURL;

// Saves the model object state
- (void)saveState;

@end
