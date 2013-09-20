//
//  Model.m
//  Tickets
//
//  Updated by Peter McIntyre on 2012/09/18.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

#pragma mark - Model lifecycle

- (id)init
{
    if (self = [super init]) {
        
        // Initialize the seats array
        NSNumber *s = [NSNumber numberWithInt:32];
        availableSeats = [NSMutableArray arrayWithObjects:s, s, s, s, nil];
        
        // Initialize the ticket cost array
        ticketCosts = [[NSMutableArray alloc] initWithCapacity:4];
        [ticketCosts addObject:[NSNumber numberWithFloat:29.8f]];
        [ticketCosts addObject:[NSNumber numberWithFloat:41.35f]];
        [ticketCosts addObject:[NSNumber numberWithFloat:103.7f]];
        [ticketCosts addObject:[NSNumber numberWithFloat:158.8f]];
    }
    return self;
}

#pragma mark - Model operations

- (int)availableSeatsForRoute:(int)route
{
    // This method simply returns the number of 
    // available seats for a given route
    
    return [[availableSeats objectAtIndex:route] intValue];
}

- (float)ticketCostForRoute:(int)route
{
    // This method simply returns the cost of 
    // a ticket for a given route

    return [[ticketCosts objectAtIndex:route] floatValue];
}

- (int)buySeats:(int)seatsToBuy forRoute:(int)route
{
    // This method returns the new available seat count AFTER
    // the "buy tickets" transaction successfully completes,
    // by reducing the old seats on route value by the number
    // of seats to buy
    
    // Fetch the number of seats on the requested route
    int seatsOnRoute = [[availableSeats objectAtIndex:route] intValue];
    
    // Process the transaction...
    if (seatsToBuy > seatsOnRoute) {
        // Problem - can't sell more than requested
        // This condition should never happen anyway
        // The user of this object should never ask for more than is available
        return -1;
    } else {
        // Calculate the new available seat count 
        int newSeatCount = seatsOnRoute - seatsToBuy;
        // Then, update the array, and return 
        [availableSeats replaceObjectAtIndex:route withObject:[NSNumber numberWithInt:newSeatCount]];
        return newSeatCount;
    }
}

@end
