//
//  NotificationsViewController.h
//  PushNotificationsTester
//
//  Created by  on 7/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CEPubnub.h"

@interface NotificationsViewController : UIViewController<CEPubnubDelegate>

@property (retain, nonatomic) IBOutlet UITextView *display;

@end
