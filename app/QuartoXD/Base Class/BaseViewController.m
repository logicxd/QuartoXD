//
//  BaseViewController.m
//  QuartoXD
//
//  Created by Aung Moe on 3/26/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

#pragma mark - CircularTransitionable Delegate

- (UIView *)mainView {
  @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                 reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                               userInfo:nil];
}

@end
