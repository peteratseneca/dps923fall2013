//
//  SubjectOutline.h
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OutlineDelegate;

@interface SubjectOutline : UIViewController <UIWebViewDelegate>

@property (nonatomic, weak) id <OutlineDelegate> delegate;

// The URL that's passed in
@property (nonatomic, copy) NSString *url;

// User interface
@property (weak, nonatomic) IBOutlet UIWebView *wvOutline;

// User operations
- (IBAction)doneBrowsing:(id)sender;

@end

// This controller's view will be presented modally, so...

// Declare a protocol
@protocol OutlineDelegate <NSObject>

- (void)DismissController:(id)controller;

@end