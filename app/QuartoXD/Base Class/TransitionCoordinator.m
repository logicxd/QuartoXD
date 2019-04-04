//
//  TransitionCoordinator.m
//  QuartoXD
//
//  Created by David Moe on 2/10/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "TransitionCoordinator.h"
#import "CircularTransition.h"

@implementation TransitionCoordinator

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
  return [[CircularTransition alloc] init];
}
@end
