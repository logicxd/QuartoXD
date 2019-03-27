//
//  CircularTransition.m
//  QuartoXD
//
//  Created by David Moe on 2/10/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "CircularTransition.h"
#import "MenuViewController.h"
#import "QuartoBoardViewController.h"

@implementation CircularTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  BaseViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  BaseViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIView *snapshot = [fromVC.view snapshotViewAfterScreenUpdates:NO];
  
  if (!fromVC || !toVC ||!snapshot) {
    [transitionContext completeTransition:NO];
    return;
  }
  
  UIView *containerView = transitionContext.containerView;
  [containerView addSubview:snapshot];
  [fromVC.mainView removeFromSuperview];
  [self animateOffscreen:snapshot];
}

#pragma mark - Helper animation

- (void)animateOffscreen:(UIView *)fromView {
  [UIView animateWithDuration:3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    fromView.transform = CGAffineTransformMakeScale(5.0, 5.0);
  } completion:nil];
}

@end
