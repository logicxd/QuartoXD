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
#import "UIView+Resizable.h"

@implementation CircularTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  BaseViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  BaseViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIView *snapshot = [fromVC.mainView snapshotViewAfterScreenUpdates:NO];
  
  if (!fromVC || !toVC ||!snapshot) {
    [transitionContext completeTransition:NO];
    return;
  }
  
  UIView *containerView = transitionContext.containerView;
  
  UIView *backgroundView = [self backgroundViewOfVC:toVC];
  
  [containerView addSubview:snapshot];
  [fromVC.mainView removeFromSuperview];
  [containerView addSubview:backgroundView];
  [self circularExpand:backgroundView];
}

- (UIView *)backgroundViewOfVC:(BaseViewController *)toVC {
  UIView *backgroundView = [[UIView alloc] init];
  backgroundView.frame = CGRectZero;
  backgroundView.center = toVC.mainView.center;
  backgroundView.backgroundColor = toVC.mainView.backgroundColor;
  return backgroundView;
}

- (void)circularExpand:(UIView *)view {
  [UIView animateWithDuration:1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    [view setSize:CGSizeMake(1, 1)];
    view.transform = CGAffineTransformMakeScale(2000.0, 2000.0);
  } completion:nil];
}

@end
