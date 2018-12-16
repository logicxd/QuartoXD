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

@interface MenuView()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *singlePlayerButton;
@property (nonatomic, strong) UIButton *versusButton;

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
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];

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
    self.singlePlayerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.singlePlayerButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.singlePlayerButton.backgroundColor = [UIColor quartoWhite];
    [self.singlePlayerButton quartoAddShadow];
    [self.singlePlayerButton setTitle:@"Single" forState:UIControlStateNormal];
    [self.singlePlayerButton setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self.singlePlayerButton addTarget:self action:@selector(singlePlayerButtonPressed) forControlEvents:UIControlEventTouchUpInside];

    self.singlePlayerButton.titleLabel.font = [UIFont quartoButtonMenu];
    
    [self addSubview:self.singlePlayerButton];
}

- (void)setupVersusButton {
    self.versusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.versusButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.versusButton.backgroundColor = [UIColor quartoWhite];
    [self.versusButton quartoAddShadow];
    [self.versusButton setTitle:@"Versus" forState:UIControlStateNormal];
    [self.versusButton setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self.versusButton addTarget:self action:@selector(versusButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.versusButton.titleLabel.font = [UIFont quartoButtonMenu];
    
    [self addSubview:self.versusButton];
}

#pragma mark - Constraint Layouts

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.singlePlayerButton.layer.cornerRadius = self.singlePlayerButton.bounds.size.height * 1/2.f;
    self.versusButton.layer.cornerRadius = self.versusButton.bounds.size.height * 1/2.f;
    
//    UIGravityBehavior *behavior = [[UIGravityBehavior alloc] initWithItems:@[self.singlePlayerButton]];
//    [self.animator addBehavior:behavior];
    
    [UIView animateWithDuration:0.33 delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = self.singlePlayerButton.frame;
        frame.origin.y = frame.origin.y - 140;
        self.singlePlayerButton.frame = frame;
    } completion:nil];
    
    [UIView animateWithDuration:0.33 delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGRect frame = self.versusButton.frame;
        frame.origin.y = frame.origin.y - 140;
        self.versusButton.frame = frame;
    } completion:nil];
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
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

#pragma mark - Button Actions

- (void)singlePlayerButtonPressed {
//    [UIView animateWithDuration:0.5 animations:^{
//        CGRect frame = self.singlePlayerButton.frame;
//        frame.origin.y = frame.origin.y - 100;
//        self.singlePlayerButton.frame = frame;
//        [self layoutIfNeeded];
//    } completion:^(BOOL finished) {
//
//    }];
    
    [self.delegate buttonPressedSinglePlayer];
}

- (void)versusButtonPressed {
    [self.delegate buttonPressedVersus];
}

#pragma mark -

@end

