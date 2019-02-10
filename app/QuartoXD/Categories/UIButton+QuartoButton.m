//
//  UIButton+QuartoButton.m
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "UIButton+QuartoButton.h"

@implementation UIButton (QuartoButton)

+ (CGSize)quartoShadowOffset {
  return CGSizeMake(0, 2.5);
}

- (void)quartoAddShadow {
  self.layer.shadowOpacity = 0.5f;
  self.layer.shadowRadius = 1;
  self.layer.shadowOffset = [UIButton quartoShadowOffset];
}

- (void)quartoAnimateShadowOffsetBy:(float)amount completion:(void(^)(BOOL finished))completion {
  [UIView animateWithDuration:QUARTO_BUTTON_ANIMATION_DURATION delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
    CGSize size = self.layer.shadowOffset;
    size.height += amount;
    self.layer.shadowOffset = size;
  } completion:completion];
}

- (void)transitionOnYAxisBy:(float)amount completion:(void(^)(BOOL finished))completion {
  [UIView animateWithDuration:QUARTO_BUTTON_ANIMATION_DURATION delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
    CGRect frame = self.frame;
    frame.origin.y += amount;
    self.frame = frame;
  } completion:completion];
}

@end
