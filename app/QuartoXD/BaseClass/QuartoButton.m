//
//  QuartoButton.m
//  QuartoXD
//
//  Created by Aung Moe on 12/15/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "QuartoButton.h"
#import "../Categories/UIColor+QuartoColor.h"
#import "../Categories/UIButton+QuartoButton.h"
#import "../Categories/UIFont+QuartoFont.h"
#import "../Utilities/SoundManager.h"

@interface QuartoButton()
@end

@implementation QuartoButton {
    BOOL _isPressed;
}

#pragma mark - Initialize Button

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _isPressed = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor quartoWhite];
        [self quartoAddShadow];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(buttonPerformAction) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(buttonPressedAnimation) forControlEvents:UIControlEventTouchDown];
        
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
    if (!_isPressed) {
        [SoundManager playSound:@"ButtonPress"];
        [self quartoAnimateShadowOffsetBy:-[UIButton quartoShadowOffset].height duration:[UIButton quartoActionAnimationDuration]];
        [self transitionOnYAxisBy:[UIButton quartoShadowOffset].height duration:[UIButton quartoActionAnimationDuration]];
        _isPressed = YES;
    }
}

- (void)buttonDepressedAnimation {
    if (_isPressed) {
        [self quartoAnimateShadowOffsetBy:[UIButton quartoShadowOffset].height duration:[UIButton quartoActionAnimationDuration]];
        [self transitionOnYAxisBy:-[UIButton quartoShadowOffset].height duration:[UIButton quartoActionAnimationDuration]];
        _isPressed = NO;
    }
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    // Modified from https://stackoverflow.com/a/14400040
    CGFloat boundsExtension = 5.0f;
    CGRect outerBounds = CGRectInset(self.bounds, -1 * boundsExtension, -1 * boundsExtension);
    
    BOOL touchOutside = !CGRectContainsPoint(outerBounds, [touch locationInView:self]);
    if(touchOutside) {
        [self buttonDepressedAnimation];
    }
    else {
        [self buttonPressedAnimation];
    }
    return [super continueTrackingWithTouch:touch withEvent:event];
}

#pragma mark -

@end
