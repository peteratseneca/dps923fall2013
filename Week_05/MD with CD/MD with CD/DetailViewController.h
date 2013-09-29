//
//  DetailViewController.h
//  MD with CD
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

// Reference to the object that we'll be displaying
@property (strong, nonatomic) id detailItem;

// User interface
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
