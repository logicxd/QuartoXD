//
//  QuartoButton.m
//  QuartoXD
//
//  Created by Aung Moe on 12/15/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "QuartoButton.h"
#import "UIColor+QuartoColor.h"
#import "UIButton+QuartoButton.h"
#import "UIFont+QuartoFont.h"
#import "SoundManager.h"
#import <AudioToolbox/AudioToolbox.h>
#import "FeedbackGenerator.h"

#define SHADOW_OFFSET_HEIGHT 2.7
#define ANIMATION_DURATION 0.125

@interface QuartoButton()
@property (assign, nonatomic) BOOL isPressed;
@property (assign, nonatomic) BOOL isAnimating;
@end

@implementation QuartoButton

#pragma mark - Life Cycle

- (instancetype)initWithTitle:(NSString *)title {
  self = [super init];
  if (self) {
    [self addShadow];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor quartoWhite]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addTarget:self action:@selector(buttonPerformAction) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(buttonPressedAnimation) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(buttonDepressedAnimation) forControlEvents:UIControlEventTouchDragOutside];
    
    [self.titleLabel setFont:[UIFont quartoButtonMenu]];
  }
  return self;
}

#pragma mark - Layout

- (void)layoutSubviews {
  [super layoutSubviews];
  self.layer.cornerRadius = self.frame.size.height / 2.f;
}

- (void)addShadow {
  self.layer.shadowOpacity = 0.5f;
  self.layer.shadowRadius = 1;
  self.layer.shadowOffset = CGSizeMake(0, SHADOW_OFFSET_HEIGHT);
}

#pragma mark - Button Events

- (void)buttonPerformAction {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0) , ^{
    while (self.isAnimating);
    dispatch_async(dispatch_get_main_queue(), ^{
      [self buttonDepressedAnimation];
      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(ANIMATION_DURATION * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.delegate performButtonActionWithButton:self];
      });
    });
  });
}

- (void)buttonPressedAnimation {
  if (!self.isPressed) {
    [SoundManager tick];
    [FeedbackGenerator impactOccurredLight];
    [self animateButton:SHADOW_OFFSET_HEIGHT];
    [self setIsPressed:YES];
  }
}

- (void)buttonDepressedAnimation {
  if (self.isPressed) {
    [self animateButton:-SHADOW_OFFSET_HEIGHT];
    [self setIsPressed:NO];
  }
}

#pragma mark - Button Animation

- (void)animateButton:(float)amount {
  [self setIsAnimating:YES];
  [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear animations:^{
    [self moveFrameOriginYByAmount:amount];
    [self moveShadowHeightByAmount:amount];
  } completion:^(BOOL finished) {
    [self setIsAnimating:NO];
  }];
}

- (void)moveFrameOriginYByAmount:(float)amount {
  CGRect frame = self.frame;
  frame.origin.y += amount;
  self.frame = frame;
}

- (void)moveShadowHeightByAmount:(float)amount {
  CGSize size = self.layer.shadowOffset;
  size.height -= amount;
  self.layer.shadowOffset = size;
}

@end
