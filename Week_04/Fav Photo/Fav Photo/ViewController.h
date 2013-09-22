//
//  ViewController.h
//  Fav Photo
//
//  Created by Peter McIntyre on 2012/06/15.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// Conform to the mail compose delegate

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>

// User interface
@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnSendPhoto;

// User interaction
- (IBAction)selectPhoto:(id)sender;
- (IBAction)sendPhoto:(id)sender;

@end
