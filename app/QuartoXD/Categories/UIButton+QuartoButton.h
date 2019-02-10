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

- (void)animateOnYAxisBy:(float)amount completion:(nullable void(^)(BOOL finished))completion;

@end
