//
//  UIButton+QuartoButton.m
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "UIButton+QuartoButton.h"

@implementation UIButton (QuartoButton)

- (void)animateOnYAxisBy:(float)amount completion:(void(^)(BOOL finished))completion {
  [UIView animateWithDuration:QUARTO_BUTTON_ANIMATION_DURATION delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:2 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut animations:^{
    CGRect frame = self.frame;
    frame.origin.y += amount;
    self.frame = frame;
  } completion:completion];
}

@end
