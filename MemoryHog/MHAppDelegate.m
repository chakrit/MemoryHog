//
//  MHAppDelegate.m
//  MemoryHog
//
//  Created by Chakrit Wichian on 9/20/12.
//  Copyright (c) 2012 Oozou Ltd.,. All rights reserved.
//

#import "MHAppDelegate.h"
#import "MHRootViewController.h"


@implementation MHAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UINavigationController *nav = [[UINavigationController alloc] init];

    MHRootViewController *root = [[MHRootViewController alloc] init];
    [nav pushViewController:root animated:NO];
    [root release];
    root = nil;

    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_window setBackgroundColor:[UIColor whiteColor]];
    [_window setRootViewController:nav];
    [nav release];
    nav = nil;

    [_window makeKeyAndVisible];
    return YES;
}

@end
