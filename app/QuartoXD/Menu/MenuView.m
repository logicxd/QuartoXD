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
#import "../Categories/UIFont+QuartoFont.h"

@interface MenuView()

@property (nonatomic, strong) UIStackView *stackView;
@property (nonatomic, strong) UIView *viewA;
@property (nonatomic, strong) UIView *viewB;

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
    [self setupStackview];
    [self setupTitle];
    
    // Inform the constraints engine to update the constraints.
    [self setNeedsUpdateConstraints];
}

- (void)setupStackview {
    self.stackView = [[UIStackView alloc] init];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.spacing = 30;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.stackView.backgroundColor = [UIColor blueColor];
    self.stackView.alpha = 0.5f;
    [self addSubview:self.stackView];
}

- (void)setupTitle {
    UILabel *title = [[UILabel alloc] init];
    title.text = @"QuartoXD";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont quartoTitle];
    title.textColor = [UIColor quartoWhite];
    title.translatesAutoresizingMaskIntoConstraints = NO;
    // Test these on different devices.
    title.minimumScaleFactor = 0.5;
    title.adjustsFontSizeToFitWidth = YES;

    self.titleShimmeringView = [[FBShimmeringView alloc] init];
    self.titleShimmeringView.contentView = title;
    self.titleShimmeringView.shimmeringSpeed = 80;
    self.titleShimmeringView.shimmeringPauseDuration = 0.50;
    self.titleShimmeringView.shimmering = YES;
    self.titleShimmeringView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.stackView addArrangedSubview:self.titleShimmeringView];
}

#pragma mark - Layouts

//- (void)layoutSubviews {
//    [super layoutSubviews];
//}
//
//+ (BOOL)requiresConstraintBasedLayout {
//    return YES;
//}

- (void)updateConstraints {
//    if (_didSetupConstraints) {
//        [super updateConstraints];
//        return;
//    }
    
    UILayoutGuide *layoutMarginsGuide = self.layoutMarginsGuide;

    [[self.stackView.topAnchor constraintEqualToAnchor:layoutMarginsGuide.topAnchor] setActive:YES];
    [[self.stackView.leftAnchor constraintEqualToAnchor:layoutMarginsGuide.leftAnchor] setActive:YES];
    [[self.stackView.rightAnchor constraintEqualToAnchor:layoutMarginsGuide.rightAnchor] setActive:YES];
    [[self.stackView.bottomAnchor constraintEqualToAnchor:layoutMarginsGuide.bottomAnchor] setActive:YES];
    
    [[self.titleShimmeringView.contentView.topAnchor constraintEqualToAnchor:self.titleShimmeringView.topAnchor] setActive:YES];
    [[self.titleShimmeringView.contentView.leftAnchor constraintEqualToAnchor:self.titleShimmeringView.leftAnchor] setActive:YES];
    [[self.titleShimmeringView.contentView.rightAnchor constraintEqualToAnchor:self.titleShimmeringView.rightAnchor] setActive:YES];
    [[self.titleShimmeringView.contentView.bottomAnchor constraintEqualToAnchor:self.titleShimmeringView.bottomAnchor] setActive:YES];
    
    [super updateConstraints];
}



@end
