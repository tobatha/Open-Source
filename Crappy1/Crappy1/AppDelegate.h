//
//  AppDelegate.h
//  Crappy1
//
//  Created by LIANG johnny on 9/11/12.
//  Copyright (c) 2012 LIANG johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) ViewController *viewController;

@end
