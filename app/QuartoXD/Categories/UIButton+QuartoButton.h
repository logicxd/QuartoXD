//
//  UIButton+QuartoButton.h
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>

#define QUARTO_BUTTON_ANIMATION_DURATION 0.1

@interface UIButton (QuartoButton)
+ (CGSize)quartoShadowOffset;

- (void)quartoAddShadow;
- (void)quartoAnimateShadowOffsetBy:(float)amount;
- (void)transitionOnYAxisBy:(float)amount;
@end
