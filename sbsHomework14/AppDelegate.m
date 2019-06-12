//
//  AppDelegate.m
//  sbsHomework14
//
//  Created by Igor Chernyshov on 07/06/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	MainViewController *mainViewController = [MainViewController new];
	CGRect screenSize = [[UIScreen mainScreen] bounds];
	self.window = [[UIWindow alloc] initWithFrame:screenSize];
	self.window.rootViewController = mainViewController;
	[self.window makeKeyAndVisible];
	return YES;
}

@end
