//
//  GuessTheShapeAppDelegate.h
//  GuessTheShape
//
//  Created by Haifa Carina Baluyos on 7/15/12.
//  Copyright 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface GuessTheShapeAppDelegate : NSObject <UIApplicationDelegate> {
    RootViewController *viewController;
}

@property (nonatomic, retain) RootViewController *viewController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
