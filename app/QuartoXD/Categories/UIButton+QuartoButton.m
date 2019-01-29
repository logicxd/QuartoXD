//
//  UIButton+QuartoButton.m
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "UIButton+QuartoButton.h"

@implementation UIButton (QuartoButton)

+ (float)quartoLoadAnimationDuration {
    return 0.33;
}

+ (float)quartoActionAnimationDuration {
    return 0.1;
}

+ (CGSize)quartoShadowOffset {
    return CGSizeMake(0, 5);
}

- (void)quartoAddShadow {
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowRadius = 1;
    self.layer.shadowOffset = [UIButton quartoShadowOffset];
}

- (void)quartoAnimateShadowOffsetBy:(float)amount duration:(float)duration {
    [UIView animateWithDuration:duration delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGSize size = self.layer.shadowOffset;
        size.height += amount;
        self.layer.shadowOffset = size;
    } completion:nil];
}

- (void)transitionOnYAxisBy:(float)amount duration:(float)duration {
    [UIView animateWithDuration:duration delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = self.frame;
        frame.origin.y += amount;
        self.frame = frame;
    } completion:nil];
}

@end