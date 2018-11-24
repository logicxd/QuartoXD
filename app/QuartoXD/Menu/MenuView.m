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
#pragma mark - Test these on different devices.
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
    [self.singlePlayerButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self addSubview:self.singlePlayerButton];
}

- (void)setupVersusButton {
    self.versusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.versusButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.versusButton.backgroundColor = [UIColor quartoWhite];
    [self.versusButton quartoAddShadow];
    [self.versusButton setTitle:@"Versus" forState:UIControlStateNormal];
    [self.versusButton setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self.versusButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self addSubview:self.versusButton];
}

#pragma mark - Layouts

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.singlePlayerButton.layer.cornerRadius = self.singlePlayerButton.bounds.size.height * 1/8.f;
    self.howToButton.layer.cornerRadius = self.howToButton.bounds.size.height * 1/8.f;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)constraintTitleLabel {
    [self.titleLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.6].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:120];
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.layoutMarginsGuide.centerXAnchor].active = YES;
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.topAnchor constant:100].active = YES;
}

- (void)constraintSinglePlayerButton {
//    [self.singlePlayerButton.widthAnchor constraintEqualToAnchor:self.layoutMarginsGuide.widthAnchor multiplier:0.5].active = YES;
    [self.singlePlayerButton.heightAnchor constraintEqualToAnchor:self.titleLabel.heightAnchor multiplier:0.4].active = YES;
    [self.singlePlayerButton.bottomAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:50].active = YES;
    [self.singlePlayerButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:1].active = YES;
    
    
    [self.singlePlayerButton.leftAnchor constraintEqualToAnchor:self.titleLabel.leftAnchor].active = YES;
    [self.singlePlayerButton.rightAnchor constraintEqualToAnchor:self.titleLabel.rightAnchor].active = YES;
    
}

- (void)constraintVersusButton {
    [self.versusButton.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:50].active = YES;
    [self.versusButton.leftAnchor constraintEqualToAnchor:self.titleLabel.leftAnchor].active = YES;
    [self.versusButton.rightAnchor constraintEqualToAnchor:self.titleLabel.rightAnchor].active = YES;
    [self.versusButton.heightAnchor constraintEqualToAnchor:self.layoutMarginsGuide.heightAnchor multiplier:0.1].active = YES;
}

- (void)updateConstraints {
    if (_didSetupConstraints) {
        [super updateConstraints];
        return;
    }
    
    [self constraintTitleLabel];
    [self constraintSinglePlayerButton];
//    [self constraintVersusButton];
    
    _didSetupConstraints = YES;
    [super updateConstraints];
}



@end
