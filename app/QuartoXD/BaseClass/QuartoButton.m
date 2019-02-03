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
//#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface QuartoButton()
@property (nonatomic, assign) BOOL isPressed;
@end

@implementation QuartoButton

#pragma mark - Initialize Button

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.isPressed = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor quartoWhite];
        [self quartoAddShadow];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(buttonPerformAction) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(buttonPressedAnimation) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(buttonDepressedAnimation) forControlEvents:UIControlEventTouchDragOutside];
        
        self.titleLabel.font = [UIFont quartoButtonMenu];
    }
    return self;
}

#pragma mark - Layout Constraints

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.frame.size.height / 2.f;
}

#pragma mark - Button Events

- (void)buttonPerformAction {
    [self buttonDepressedAnimation];
    [self.delegate performButtonActionWithButton:self];
}

- (void)buttonPressedAnimation {
    if (!self.isPressed) {
        [SoundManager peak];
        
        [self quartoAnimateShadowOffsetBy:-[UIButton quartoShadowOffset].height completion:nil];
        [self transitionOnYAxisBy:[UIButton quartoShadowOffset].height completion:nil];
        self.isPressed = YES;
    }
}

- (void)buttonDepressedAnimation {
    if (self.isPressed) {
        [self quartoAnimateShadowOffsetBy:[UIButton quartoShadowOffset].height completion:nil];
        [self transitionOnYAxisBy:-[UIButton quartoShadowOffset].height completion:nil];
        self.isPressed = NO;
    }
}

#pragma mark -

@end
