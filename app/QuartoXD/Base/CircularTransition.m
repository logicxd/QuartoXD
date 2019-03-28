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
  [self circularExpand:backgroundView vc:toVC];
}

- (UIView *)backgroundViewOfVC:(BaseViewController *)toVC {
  UIView *backgroundView = [[UIView alloc] init];
  backgroundView.frame = CGRectZero;
  backgroundView.center = toVC.mainView.center;
  backgroundView.backgroundColor = toVC.mainView.backgroundColor;
  return backgroundView;
}

- (void)circularExpand:(UIView *)view vc:(BaseViewController *)vc {
  CGFloat initialSize = 10;
  [view setSize:CGSizeMake(initialSize, initialSize)];
  view.layer.cornerRadius = initialSize/2;

  [UIView animateWithDuration:0.75 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    CGSize vcSize = vc.view.frame.size;
    CGFloat fullSize = vcSize.width > vcSize.height ? vcSize.width : vcSize.height;
    CGFloat scale = fullSize / initialSize;
    scale = scale * 1.3f;  // Screen corner doesn't get covered without this
    
    view.transform = CGAffineTransformMakeScale(scale, scale);
  } completion:nil];
}

@end
