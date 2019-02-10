//
//  UIButton+QuartoButton.h
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (QuartoButton)

- (void)animateOnYAxisBy:(float)amount duration:(float)duration completion:(nullable void(^)(BOOL finished))completion;

@end
