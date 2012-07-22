//
//  NotificationsViewController.m
//  PushNotificationsTester
//
//  Created by  on 7/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

CEPubnub *pubnub;
@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    pubnub = [[CEPubnub alloc] initWithPublishKey:@"demo" subscribeKey:@"demo" secretKey:@"demo" cipherKey:nil useSSL:NO];
	
	[pubnub setDelegate:self];
    [pubnub subscribe: @"demo"];

}

- (void)viewDidUnload
{
    [self setDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) pubnub:(CEPubnub*)pubnub subscriptionDidReceiveString:(NSString *)message onChannel:(NSString *)channel{
    
    NSLog(@"Subscribe   %@",message);
    [display setText:[NSString stringWithFormat:@"%@ - received:\n %@", channel, message]];
}

- (void) pubnub:(CEPubnub*)pubnub subscriptionDidReceiveDictionary:(NSDictionary *)message onChannel:(NSString *)channel{
    NSLog(@"Subscribe   %@",message);
    [display setText:[NSString stringWithFormat:@"%@ - received:\n %@", channel, message]];
}

- (void) pubnub:(CEPubnub*)pubnub subscriptionDidReceiveArray:(NSArray *)message onChannel:(NSString *)channel{
    
    NSLog(@"Array Subscribe   %@",message);
    [display setText:[NSString stringWithFormat:@": %@ - received\n: %@", channel, message]];
}

- (void) pubnub:(CEPubnub*)pubnub subscriptionDidFailWithResponse:(NSString *)message onChannel:(NSString *)channel
{
    NSLog(@"Subscription Error:  %@",message);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc {
    [pubnub release];
    [display release];
    [super dealloc];
}

@end
