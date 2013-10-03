//
//  EventDetail.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetail : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblEvent;

@property (nonatomic, strong) NSManagedObject *ro;

@end
