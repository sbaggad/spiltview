//
//  AppDelegate.h
//  SplitView
//
//  Created by Shona Baggad on 03/02/14.
//  Copyright (c) 2014 HTECH-008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic)UINavigationController *navController;
@end
