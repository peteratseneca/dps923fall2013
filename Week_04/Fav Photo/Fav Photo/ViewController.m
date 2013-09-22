//
//  ViewController.m
//  Fav Photo
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Resizing.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If we can't send email (e.g. on the simulator), hide the "send email" button
    if (![MFMailComposeViewController canSendMail]) [self.btnSendPhoto removeFromSuperview];
    
    // Note: The iPhone Simulator will return YES from canSendMail 
    // It does this so that you can test / simulate the mail send activity 
}

- (void)viewDidUnload
{
    [self setIvPhoto:nil];
    [self setBtnSendPhoto:nil];
    [super viewDidUnload];
}

#pragma mark - User operations

- (IBAction)selectPhoto:(id)sender 
{
    // Create an instance of the image picker
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
	// Check whether the device has a camera - if not, we'll use the photo library
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		// Camera action
		imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
	} else {
		// Photo library action
		imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	}
	
	// Set this object to be its delegate; we do this for code-created controllers/objects
	imagePicker.delegate = self;
	
	// Don't support editing for now
	imagePicker.allowsEditing = NO;
    
	// Present the image picker
    [self presentViewController:imagePicker animated:YES completion:NULL];
	// deprecated [self presentModalViewController:imagePicker animated:YES];

}

- (IBAction)sendPhoto:(id)sender 
{
    // This method can be called in two situations:
    // 1) On the iPhone Simulator (and it simulates the mail send operation) 
    // 2) On a device that DOES have an email account configured 
    
	// Create an instance of a mail compose view controller
	MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];

	// Set its properties
	[mailer setMessageBody:@"Here is my favourite photo!" isHTML:NO];
	[mailer setSubject:@"My favourite photo"];
	[mailer setToRecipients:[NSArray arrayWithObject:@"user@example.com"]];

	// Add the photo as an attachment
    NSData *imageData = UIImageJPEGRepresentation(self.ivPhoto.image, 1.0f);
    [mailer addAttachmentData:imageData mimeType:@"image/jpeg" fileName:@"MyFavouritePhoto"];
    
	// Handle the result (see the next method, which is a delegate method)
	mailer.mailComposeDelegate = self;
	
	// Show modally
    [self presentViewController:mailer animated:YES completion:NULL];
	// deprecated [self presentModalViewController:mailer animated:YES];
}

#pragma mark - Delegate methods

// DELEGATE METHOD
// Handles the selection of an image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	// Get the image that was selected
	UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

    CGImageRef imgRef = selectedImage.CGImage;
    CGFloat w = CGImageGetWidth(imgRef);
    CGFloat h = CGImageGetHeight(imgRef);
    UIImageOrientation orient = selectedImage.imageOrientation;
    
    NSLog(@"\nFYI - Width %1.1f, Height %1.1f, Orientation %d", w, h, orient);
    
    // If the image is too big, scale it smaller
    
    UIImage *image = nil;
    
    if (w > 160.0f) 
    {
        // This means that it was taken by the camera
        // We must rotate and scale the image
        
        // This code was obtained from...
        // http://stackoverflow.com/questions/538041/uiimagepickercontroller-camera-preview-is-portrait-in-landscape-app
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        CGRect bounds = CGRectMake(0, 0, w, h);
        CGFloat boundHeight;
        CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
        CGFloat scaleRatio = bounds.size.width / w;
        
        boundHeight = bounds.size.height;
        bounds.size.height = bounds.size.width;
        bounds.size.width = boundHeight;
        transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
        transform = CGAffineTransformRotate(transform, M_PI / 2.0);
        
        UIGraphicsBeginImageContext(bounds.size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -h, 0);
        CGContextConcatCTM(context, transform);
        
        CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, w, h), imgRef);
        UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        image = [imageCopy scaleToSize:CGSizeMake(160.0f, 240.0f)];
    } 
    else 
    {
        image = selectedImage;
    }
    
	// Show it
	self.ivPhoto.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
	// deprecated [picker dismissModalViewControllerAnimated:YES];
}

// DELEGATE METHOD
// Handles the mail compose operation
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // For sure, we must dismiss the mail compose view controller
    // We do that at the end of the method

    // We could inspect the error
    // We could also use the result if we wished
    // See the following code blocks for example code
    
    if (error) 
    {
		NSLog(@"Error sending mail");
		
		// Tell the user that there was an error sending email
		UIAlertView *errorSendingMail = 
		[[UIAlertView alloc] initWithTitle:@"Error sending email" 
								   message:[error localizedDescription] 
								  delegate:NULL 
						 cancelButtonTitle:@"OK" 
						 otherButtonTitles:NULL];
		[errorSendingMail show];
	}
	
	// In this code block, you can decide how to handle the various results
	// Below, we're just going to send the result to the console log
	NSString *mailActionResult;
	switch (result) {
		case MFMailComposeResultSent:
			mailActionResult = @"sent";
			break;
		case MFMailComposeResultSaved:
			mailActionResult = @"saved";
			break;
		case MFMailComposeResultCancelled:
			mailActionResult = @"cancelled";
			break;
		case MFMailComposeResultFailed:
			mailActionResult = @"failed";
			break;
	}
	NSLog(@"mailActionResult - %@", mailActionResult);

    [controller dismissViewControllerAnimated:YES completion:NULL];
	// deprecated [controller dismissModalViewControllerAnimated:YES];
}

@end
