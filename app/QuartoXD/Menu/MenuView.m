//
//  MenuView.m
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "MenuView.h"
#import "FBShimmeringView.h"
#import "../Categories/UIColor+QuartoColor.h"

@implementation MenuView

#pragma mark - Initialize

- (instancetype)init {
    if (self = [super init]) {
        [self setupTitle];
    }
    return self;
}

- (void)setupTitle {
    UILabel *title = [[UILabel alloc] init];
    title.text = @"QuartoXD";
    title.textAlignment = NSTextAlignmentCenter;
//    title.font = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
    title.font = [UIFont systemFontOfSize:40.0f];
    title.textColor = [UIColor quartoWhite];
    
    self.titleShimmeringView = [[FBShimmeringView alloc] initWithFrame:CGRectZero];
    self.titleShimmeringView.contentView = title;
    self.titleShimmeringView.shimmeringSpeed = 80;
    self.titleShimmeringView.shimmeringPauseDuration = 0.50;
    self.titleShimmeringView.shimmering = YES;
    
    [self addSubview:self.titleShimmeringView];
}

#pragma mark - Layouts

//+ (BOOL)requiresConstraintBasedLayout {
//    return YES;
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)updateConstraints {
    
    // Title
    UILayoutGuide *guide = self.layoutMarginsGuide;
    
//    [[self.titleShimmeringView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:1.0] setActive:YES];
//    [[self.titleShimmeringView.widthAnchor constraintEqualToAnchor:self.widthAnchor constant:1] setActive:YES];
//    [[self.titleShimmeringView.heightAnchor constraintEqualToAnchor:self.heightAnchor constant:1] setActive:YES];
    
    [[self.centerXAnchor constraintEqualToAnchor:self.titleShimmeringView.centerXAnchor constant:1.0] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:guide.topAnchor constant:1.0] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:1.0] setActive:YES];
    
//    [[self.titleShimmeringView.leadingAnchor constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:margins.leadingAnchor multiplier:1.0] setActive:YES];
//
//    [[self.titleShimmeringView.trailingAnchor constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:margins.trailingAnchor multiplier:1.0] setActive:YES];
//
//    [[self.titleShimmeringView.heightAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.5] setActive:YES];
    
//    [self.titleShimmeringView.superview addConstraint:[NSLayoutConstraint
//                                                       constraintWithItem:self.titleShimmeringView.superview
//                                                       attribute:NSLayoutAttributeCenterX
//                                                       relatedBy:NSLayoutRelationEqual
//                                                       toItem:self.titleShimmeringView
//                                                       attribute:NSLayoutAttributeCenterX
//                                                       multiplier:1
//                                                       constant:0]];
//
//    [self.titleShimmeringView.superview addConstraint:[NSLayoutConstraint
//                                                       constraintWithItem:self.titleShimmeringView.superview
//                                                       attribute:NSLayoutAttributeCenterY
//                                                       relatedBy:NSLayoutRelationEqual
//                                                       toItem:self.titleShimmeringView
//                                                       attribute:NSLayoutAttributeCenterY
//                                                       multiplier:1
//                                                       constant:0]];
    
    
    
    [super updateConstraints];
}



@end
