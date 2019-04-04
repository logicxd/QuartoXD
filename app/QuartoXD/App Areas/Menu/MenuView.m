//
//  MenuView.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "MenuView.h"
#import "UIColor+QuartoColor.h"
#import "UIFont+QuartoFont.h"
#import "UIButton+QuartoButton.h"
#import "QuartoButton.h"

#define BUTTON_LOAD_ANIMATION_DURATION 0.33

@interface MenuView()

@property (assign, nonatomic) BOOL didSetupConstraints;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) QuartoButton *singlePlayerButton;
@property (strong, nonatomic) QuartoButton *versusButton;
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end

@implementation MenuView

#pragma mark - Initialize View

- (instancetype)init {
  if (self = [super init]) {
    [self setup];
  }
  return self;
}

- (void)setup {
  // Set up properties of the view itself
  self.didSetupConstraints = NO;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  self.clipsToBounds = YES;
  self.backgroundColor = [UIColor quartoRed];
  
  // Set up subviews
  [self setupTitle];
  [self setupSinglePlayerButton];
  [self setupVersusButton];
  
  // Inform the constraints engine to update the constraints.
  [self setNeedsUpdateConstraints];
}

#pragma mark - Set up views

- (void)setupTitle {
  self.titleLabel = [[UILabel alloc] init];
  self.titleLabel.text = @"QuartoXD";
  self.titleLabel.textAlignment = NSTextAlignmentCenter;
  self.titleLabel.font = [UIFont quartoTitle];
  self.titleLabel.textColor = [UIColor quartoWhite];
  self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
  // TODO - Test these on different devices.
  self.titleLabel.minimumScaleFactor = 0.5;
  self.titleLabel.adjustsFontSizeToFitWidth = YES;
  [self addSubview:self.titleLabel];
}

- (void)setupSinglePlayerButton {
  self.singlePlayerButton = [[QuartoButton alloc] initWithTitle:@"Single"];
  self.singlePlayerButton.delegate = self;
  [self addSubview:self.singlePlayerButton];
}

- (void)setupVersusButton {
  self.versusButton = [[QuartoButton alloc] initWithTitle:@"Versus"];
  self.versusButton.delegate = self;
  [self addSubview:self.versusButton];
}

#pragma mark - Constraint Layouts

+ (BOOL)requiresConstraintBasedLayout {
  return YES;
}

- (void)updateConstraints {
  if (self.didSetupConstraints) {
    [super updateConstraints];
    return;
  }
  
  [self constraintSelf];
  [self constraintTitleLabel];
  [self constraintSinglePlayerButton];
  [self constraintVersusButton];
  
  self.didSetupConstraints = YES;
  [super updateConstraints];
}

- (void)constraintSelf {
  [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
  [self.leftAnchor constraintEqualToAnchor:self.superview.leftAnchor].active = YES;
  [self.rightAnchor constraintEqualToAnchor:self.superview.rightAnchor].active = YES;
  [self.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor].active = YES;
}

- (void)constraintTitleLabel {
  [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.layoutMarginsGuide.centerXAnchor].active = YES;
  [self.titleLabel.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.topAnchor constant:140].active = YES;
  [self.titleLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.6].active = YES;
}

- (void)constraintSinglePlayerButton {
  [self.singlePlayerButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
  [self.singlePlayerButton.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor constant:-140].active = YES;
  [self.singlePlayerButton.leftAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leftAnchor constant:25].active = YES;
  [self.singlePlayerButton.rightAnchor constraintEqualToAnchor:self.layoutMarginsGuide.rightAnchor constant:-25].active = YES;
  [self.singlePlayerButton.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)constraintVersusButton {
  [self.versusButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
  [self.versusButton.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor constant:-70].active = YES;
  [self.versusButton.leftAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leftAnchor constant:25].active = YES;
  [self.versusButton.rightAnchor constraintEqualToAnchor:self.layoutMarginsGuide.rightAnchor constant:-25].active = YES;
  [self.versusButton.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  self.singlePlayerButton.layer.cornerRadius = self.singlePlayerButton.bounds.size.height * 1/2.f;
  self.versusButton.layer.cornerRadius = self.versusButton.bounds.size.height * 1/2.f;  
}

#pragma mark - Quarto Button Delegate

- (void)performButtonActionWithButton:(QuartoButton *)button {
  if ([button isEqual:self.singlePlayerButton]) {
    [self.delegate buttonPressedSinglePlayer];
  } else if ([button isEqual:self.versusButton]) {
    [self.delegate buttonPressedVersus];
  }
}

@end

