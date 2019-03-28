//
//  MenuViewController.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuView.h"
#import "UIColor+QuartoColor.h"
#import "QuartoBoardViewController.h"

@implementation MenuViewController

@dynamic view;

#pragma mark - Lifecycle

- (void)loadView {
  self.view = [[MenuView alloc] init];
  self.view.delegate = self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

#pragma mark - Button Delegates

- (void)buttonPressedSinglePlayer {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
      QuartoBoardViewController *vc = [[QuartoBoardViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
    });
  });
}

- (void)buttonPressedVersus {
  
}

#pragma mark - CircularTransitionable Delegate

- (UIView *)mainView {
  return self.view;
}

#pragma mark -

@end
