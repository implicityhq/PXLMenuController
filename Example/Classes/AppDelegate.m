//
//  AppDelegate.m
//  Example
//
//  Created by Jason Silberman on 8/13/14.
//  Copyright (c) 2014 Jason Silberman. All rights reserved.
//

#import "AppDelegate.h"

#import "ExampleViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	self.window.rootViewController = [[ExampleViewController alloc] init];
	
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	return YES;
}

@end
