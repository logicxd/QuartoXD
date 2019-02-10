//
//  AppDelegate.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "SoundManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  MenuViewController *menuController = [[MenuViewController alloc] init];
  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:menuController];
  [nav setNavigationBarHidden:YES];
  self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  self.window.rootViewController = nav;
  [self.window makeKeyAndVisible];
  [SoundManager setupAVAudioSession];
  return YES;
}
@end
