//
//  NotasSAppDelegate.h
//  NotasS
//
//  Created by Matheus Brum on 25/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NotasSViewController;

@interface NotasSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NotasSViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NotasSViewController *viewController;

@end

