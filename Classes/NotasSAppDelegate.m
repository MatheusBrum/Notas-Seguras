//
//  NotasSAppDelegate.m
//  NotasS
//
//  Created by Matheus Brum on 25/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "NotasSAppDelegate.h"
#import "NotasSViewController.h"

@implementation NotasSAppDelegate

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
