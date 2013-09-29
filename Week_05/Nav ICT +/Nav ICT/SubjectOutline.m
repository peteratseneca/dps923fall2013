//
//  SubjectOutline.m
//  Nav ICT
//
//  Created by Peter McIntyre on 2012/06/20.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SubjectOutline.h"

@interface SubjectOutline ()

@end

@implementation SubjectOutline {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Note...
	// The UIWebView in the storyboard has this setting checked on: Scales Page To Fit
	
	// Set the delegate so that we can show a network activity indicator 
	// in the top-of-screen status bar (if you don't care about showing it,
	// you can leave out the delegate code) 
	// The .h interface has been edited to conform to the <UIWebViewDelegate> protocol
	[self.wvOutline setDelegate:self];
	
	// Load the web page...
	
	// Create a URL from the string that was passed in
	NSURL *url = [[NSURL alloc] initWithString:self.url];
	
	// Create a request by using the URL we just created
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	
	// Now, get the UIWebView to load the request, and clean up
	[self.wvOutline loadRequest:request];
    
}

- (void)viewDidUnload
{
    [self setWvOutline:nil];
    [super viewDidUnload];
}

#pragma mark - UIWebViewDelegate methods

// We want to know when the UIWebView is loading a document, so we can show the network activity indicator
// We can show it on the view itself, or on the top status bar; the code below shows it on the status bar

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - User operations

- (IBAction)doneBrowsing:(id)sender 
{
    [self.delegate DismissController:self];
}

@end
