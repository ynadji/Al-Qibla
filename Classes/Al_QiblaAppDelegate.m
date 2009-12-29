//
//  Al_QiblaAppDelegate.m
//  Al-Qibla
//
//  Created by Yacin Nadji on 12/17/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import "Al_QiblaAppDelegate.h"
#import "Al_QiblaViewController.h"

@implementation Al_QiblaAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
