//
//  Events_1ViewController.m
//  Events 1
//
//  Created by Peter McIntyre on 2010/09/19.
//  Copyright Seneca College 2010. All rights reserved.
//

#import "Events_1ViewController.h"

@implementation Events_1ViewController

@synthesize allEvents, tvResults;

// INSTANCE METHOD - show the events string in the text view
- (void) showEvents:(id)sender {
	self.tvResults.text = self.allEvents;
//	tvResults.text = self.allEvents;
}

// SUPERCLASS METHOD
- (void) viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	// Update the string
	self.allEvents = [NSString stringWithFormat:@"%@\n%s", self.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

// SUPERCLASS METHOD
- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	// Update the string
	self.allEvents = [NSString stringWithFormat:@"%@\n%s", self.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

// SUPERCLASS METHOD
- (void) awakeFromNib {
	[super awakeFromNib];
	
	// Update the string
	self.allEvents = [NSString stringWithFormat:@"%@\n%s", self.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	// Update the string
	self.allEvents = [NSString stringWithFormat:@"%@\n%s", self.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	
	self.tvResults = nil;

	// Update the string
	self.allEvents = [NSString stringWithFormat:@"%@\n%s", self.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);
}

- (void)dealloc {
	// Update the string
	self.allEvents = [NSString stringWithFormat:@"%@\n%s", self.allEvents, __FUNCTION__];
	// Update the console log
	NSLog(@"\n%s", __FUNCTION__);

	[tvResults release];
	[allEvents release];
	
    [super dealloc];
}

@end
