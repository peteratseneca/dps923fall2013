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
    // Create objects

    NSManagedObject *p1 = [model addNewProfessor:@"Peter McIntyre" inOffice:@"T2080" atEmail:@"peter.mcintyre@senecacollege.ca" andWebSite:@"http://petermcintyre.com"];

    NSManagedObject *p2 = [model addNewProfessor:@"Ian Tipson" inOffice:@"T2079" atEmail:@"ian.tipson@senecacollege.ca" andWebSite:@"http://scs.senecac.on.ca/~ian.tipson/"];

    NSManagedObject *p3 = [model addNewProfessor:@"Jordan Anastasiade" inOffice:@"T1034" atEmail:@"jordan.anastasiade@senecacollege.ca" andWebSite:@"http://scs.senecac.on.ca/~jordan.anastasiade/"];

    NSManagedObject *p4 = [model addNewProfessor:@"Barb Czegel" inOffice:@"T2095" atEmail:@"barb.czegel@senecacollege.ca" andWebSite:@"http://scs.senecac.on.ca/~barb.czegel/"];
    
    // Save
    [model saveChanges];

    // Clean up to suppress compiler warnings
    p1 = nil, p2=nil, p3=nil, p4=nil;
    
}

@end
