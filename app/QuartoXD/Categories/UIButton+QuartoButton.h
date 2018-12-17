//
//  UIButton+QuartoButton.h
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (QuartoButton)
+ (float)quartoLoadAnimationDuration;
+ (float)quartoActionAnimationDuration;
+ (CGSize)quartoShadowOffset;

- (void)quartoAddShadow;
- (void)quartoAnimateShadowOffsetBy:(float)amount duration:(float)duration;
- (void)transitionOnYAxisBy:(float)amount duration:(float)duration;
@end
