//
//  AppDelegate.h
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionCoordinator.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TransitionCoordinator *transitionCoordinator;

@end

