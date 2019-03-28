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
  UIView *transitionView = [self transitionView:toVC];
  
  [containerView addSubview:snapshot];
  [containerView addSubview:transitionView];
  [fromVC.mainView removeFromSuperview];

  [self circularExpand:transitionView size:toVC.view.frame.size];
}

- (UIView *)transitionView:(BaseViewController *)vc {
  UIView *view = [[UIView alloc] init];
  view.frame = CGRectZero;
  view.center = vc.mainView.center;
  view.backgroundColor = vc.mainView.backgroundColor;
  return view;
}

- (void)circularExpand:(UIView *)view size:(CGSize)size {
  CGFloat initialSize = 10;
  [view setSize:CGSizeMake(initialSize, initialSize)];
  view.layer.cornerRadius = initialSize/2;

  [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    CGFloat fullSize = size.width > size.height ? size.width : size.height;
    CGFloat scale = fullSize / initialSize;
    scale = scale * 1.15f;  // Cover the corners
    
    view.transform = CGAffineTransformMakeScale(scale, scale);
  } completion:nil];
}

@end
