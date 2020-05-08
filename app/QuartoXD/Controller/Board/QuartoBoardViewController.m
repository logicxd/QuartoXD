//
//  QuartoBoardViewController.m
//  QuartoXD
//
//  Created by David Moe on 2/10/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "QuartoBoardViewController.h"

@interface QuartoBoardViewController ()
@end

@implementation QuartoBoardViewController

@dynamic view;

- (void)loadView {
  self.view = [[QuartoBoardView alloc] init];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

#pragma mark - CircularTransitionable Delegate

- (UIView *)mainView {
  return self.view;
}

#pragma mark -

@end
