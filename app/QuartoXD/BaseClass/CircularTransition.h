//
//  CircularTransition.h
//  QuartoXD
//
//  Created by David Moe on 2/10/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CircleTransitionable <NSObject>

- (UIButton *)triggerButton;
- (UITextView *)contentTextView;
- (UIView *)mainView;

@end

@interface CircularTransition : NSObject <UIViewControllerAnimatedTransitioning>

@end

NS_ASSUME_NONNULL_END
