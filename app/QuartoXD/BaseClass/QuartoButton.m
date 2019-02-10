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

#define SHADOW_OFFSET_HEIGHT 2.5

@interface QuartoButton()
@property (assign, nonatomic) BOOL isPressed;
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
  [self buttonDepressedAnimation];
  [self.delegate performButtonActionWithButton:self];
}

- (void)buttonPressedAnimation {
  if (!self.isPressed) {
    [FeedbackGenerator impactOccurredLight];
    [SoundManager tick];
    [self animateButton:SHADOW_OFFSET_HEIGHT];
    self.isPressed = YES;
  }
}

- (void)buttonDepressedAnimation {
  if (self.isPressed) {
    [self animateButton:-SHADOW_OFFSET_HEIGHT];
    self.isPressed = NO;
  }
}

#pragma mark - Button Animation

- (void)animateButton:(float)amount {
  [UIView animateWithDuration:QUARTO_BUTTON_ANIMATION_DURATION delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:2 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear animations:^{
    CGRect frame = self.frame;
    frame.origin.y += amount;
    self.frame = frame;
    
    CGSize size = self.layer.shadowOffset;
    size.height -= amount;
    self.layer.shadowOffset = size;
  } completion:nil];
}

@end
