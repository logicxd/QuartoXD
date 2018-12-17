//
//  MenuView.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "MenuView.h"
#import "../Categories/UIColor+QuartoColor.h"
#import "../Categories/UIFont+QuartoFont.h"
#import "../Categories/UIButton+QuartoButton.h"
#import "../BaseClass/QuartoButton.h"

@interface MenuView()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) QuartoButton *singlePlayerButton;
@property (nonatomic, strong) QuartoButton *versusButton;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation MenuView {
    BOOL _didSetupConstraints;
}

#pragma mark - Initialize View

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // Set up properties of the view itself
    _didSetupConstraints = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.clipsToBounds = YES;

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
    if (_didSetupConstraints) {
        [super updateConstraints];
        return;
    }
    
    [self constraintTitleLabel];
    [self constraintSinglePlayerButton];
    [self constraintVersusButton];
    
    _didSetupConstraints = YES;
    [super updateConstraints];
}

- (void)constraintTitleLabel {
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.layoutMarginsGuide.centerXAnchor].active = YES;
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.topAnchor constant:140].active = YES;
    [self.titleLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.6].active = YES;
}

- (void)constraintSinglePlayerButton {
    [self.singlePlayerButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.singlePlayerButton.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor].active = YES;
    [self.singlePlayerButton.leftAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leftAnchor constant:25].active = YES;
    [self.singlePlayerButton.rightAnchor constraintEqualToAnchor:self.layoutMarginsGuide.rightAnchor constant:-25].active = YES;
    [self.singlePlayerButton.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)constraintVersusButton {
    [self.versusButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.versusButton.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor constant:70].active = YES;
    [self.versusButton.leftAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leftAnchor constant:25].active = YES;
    [self.versusButton.rightAnchor constraintEqualToAnchor:self.layoutMarginsGuide.rightAnchor constant:-25].active = YES;
    [self.versusButton.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.singlePlayerButton.layer.cornerRadius = self.singlePlayerButton.bounds.size.height * 1/2.f;
    self.versusButton.layer.cornerRadius = self.versusButton.bounds.size.height * 1/2.f;
    
    [self.singlePlayerButton transitionOnYAxisBy:-140 duration:[UIButton quartoLoadAnimationDuration]];
    [self.versusButton transitionOnYAxisBy:-140 duration:[UIButton quartoLoadAnimationDuration]];
}

#pragma mark - Button Actions

- (void)performButtonActionWithButton:(QuartoButton *)button {
    if ([button isEqual:self.singlePlayerButton]) {
        [self.delegate buttonPressedSinglePlayer];
    } else if ([button isEqual:self.versusButton]) {
        [self.delegate buttonPressedVersus];
    }
}

#pragma mark -

@end

