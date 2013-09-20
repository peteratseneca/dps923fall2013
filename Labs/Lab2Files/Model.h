//
//  Model.h
//  Tickets
//
//  Updated by Peter McIntyre on 2012/09/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

// If you want to use this model object in one of your classes,
// then make sure that you add this: #import "Model.h"

#import <Foundation/Foundation.h>

@interface Model : NSObject
{
    // Instance variables to hold up-to-date data
    NSMutableArray *availableSeats;
    NSMutableArray *ticketCosts;
}

// Returns the number of available seats on a given route
- (int)availableSeatsForRoute:(int)route;

// Returns the ticket cost on a given route
- (float)ticketCostForRoute:(int)route;

// Processes a "buy tickets" transaction
- (int)buySeats:(int)seats forRoute:(int)route;

@end
