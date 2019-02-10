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
#define BUTTON_ANIMATION_DURATION 0.125

@interface QuartoButton()
@property (assign, nonatomic) BOOL isPressed;
@property (assign, nonatomic) BOOL isAnimating;
@end

@implementation QuartoButton

#pragma mark - Life Cycle

- (instancetype)initWithTitle:(NSString *)title {
  self = [super init];
  if (self) {
    self.isPressed = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor quartoWhite];
    [self addShadow];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(buttonPerformAction) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(buttonPressedAnimation) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(buttonDepressedAnimation) forControlEvents:UIControlEventTouchDragOutside];
    
    self.titleLabel.font = [UIFont quartoButtonMenu];
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
    while (self.isAnimating) {}
    dispatch_async(dispatch_get_main_queue(), ^{
      [self buttonDepressedAnimation];
      [self.delegate performButtonActionWithButton:self];
    });
  });
}

- (void)buttonPressedAnimation {
  if (!self.isPressed) {
    [FeedbackGenerator impactOccurredLight];
    [SoundManager tick];
    [self animateButton:SHADOW_OFFSET_HEIGHT];
    self.isPressed = YES;
    [self.delegate touchDownEventFromButton:self];
  }
}

- (void)buttonDepressedAnimation {
  if (self.isPressed) {
    [self animateButton:-SHADOW_OFFSET_HEIGHT];
    self.isPressed = NO;
    [self.delegate touchUpEventFromButton:self];
  }
}

#pragma mark - Button Animation

- (void)animateButton:(float)amount {
  self.isAnimating = YES;
  [UIView animateWithDuration:BUTTON_ANIMATION_DURATION delay:0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear animations:^{
    CGRect frame = self.frame;
    frame.origin.y += amount;
    self.frame = frame;
    
    CGSize size = self.layer.shadowOffset;
    size.height -= amount;
    self.layer.shadowOffset = size;
  } completion:^(BOOL finished) {
    self.isAnimating = NO;
  }];
}

@end
