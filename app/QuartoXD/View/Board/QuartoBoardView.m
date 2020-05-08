//
//  QuartoBoardView.m
//  QuartoXD
//
//  Created by Aung Moe on 1/29/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "QuartoBoardView.h"
#import "UIColor+QuartoColor.h"

@interface QuartoBoardView ()
@property (assign, nonatomic) BOOL didSetupConstraints;
@property (strong, nonatomic) UIButton *settingsButton;
@end

@implementation QuartoBoardView

- (instancetype)init {
  if (self = [super init]) {
    [self setup];
  }
  return self;
}

- (void)setup {
  // Set up the properties of the view itself
  self.didSetupConstraints = NO;
  self.backgroundColor = [UIColor quartoGray];
  
  // Set up subviews
  [self addSettingsButton];
  
  // Inform the constraints engine to update the constraints
  [self setNeedsUpdateConstraints];
}

#pragma mark - Settings button

- (void)addSettingsButton {
  self.settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
  UIImage *settingsImage = [UIImage imageNamed:@"Settings-50"];
  [self.settingsButton setBackgroundImage:settingsImage forState:UIControlStateNormal];
  [self.settingsButton addTarget:self action:@selector(tappedSettingsButton) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:self.settingsButton];
}

- (void)tappedSettingsButton {
  NSLog(@"Tapped settings button");
}

#pragma mark - Constraints

+ (BOOL)requiresConstraintBasedLayout {
  return YES;
}

- (void)updateConstraints {
  if (self.didSetupConstraints) {
    [super updateConstraints];
    return;
  }
  
  [self constraintSelf];
  [self constraintSettingsButton];
  self.didSetupConstraints = YES;
  [super updateConstraints];
}

- (void)constraintSelf {
  [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
  [self.leftAnchor constraintEqualToAnchor:self.superview.leftAnchor].active = YES;
  [self.rightAnchor constraintEqualToAnchor:self.superview.rightAnchor].active = YES;
  [self.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor].active = YES;
}

- (void)constraintSettingsButton {
  UILayoutGuide *safeArea = self.safeAreaLayoutGuide;
  [self.settingsButton.topAnchor constraintEqualToAnchor:safeArea.topAnchor constant:50].active = YES;
  [self.settingsButton.centerXAnchor constraintEqualToAnchor:safeArea.centerXAnchor].active = YES;
  [self.settingsButton.heightAnchor constraintEqualToConstant:50.f].active = YES;
  [self.settingsButton.widthAnchor constraintEqualToConstant:50.f].active = YES;
}

@end
