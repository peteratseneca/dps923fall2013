//
//  Events_1ViewController.h
//  Events 1
//
//  Created by Peter McIntyre on 2010/09/19.
//  Copyright Seneca College 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Events_1ViewController : UIViewController {

}

// A string that concatenates the method names which are being called
@property (nonatomic, copy) NSString *allEvents;

// A scrollable multi-line text view in the user interface
@property (nonatomic, retain) IBOutlet UITextView *tvResults;

// Method called by a button tap
- (IBAction)showEvents:(id)sender;

@end
