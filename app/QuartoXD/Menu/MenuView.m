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

@interface MenuView()

@property (nonatomic, strong) UIStackView *stackView;

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
    [self setupSinglePlayerButton];
    [self setupHowToButton];
    
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
    [self addSubview:self.stackView];
}

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
    [self.stackView addArrangedSubview:self.titleLabel];
}

- (void)setupSinglePlayerButton {
    self.singlePlayerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.singlePlayerButton.layer.shadowOpacity = 0.5f;
    self.singlePlayerButton.layer.shadowRadius = 1;
    self.singlePlayerButton.layer.shadowOffset = CGSizeMake(0, 6);
    self.singlePlayerButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.singlePlayerButton.backgroundColor = [UIColor quartoWhite];
    [self.singlePlayerButton setTitle:@"Single" forState:UIControlStateNormal];
    [self.singlePlayerButton setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self.singlePlayerButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.stackView addArrangedSubview:self.singlePlayerButton];
}

- (void)setupHowToButton {
    self.howToButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.howToButton.layer.shadowOpacity = 0.5f;
    self.howToButton.layer.shadowRadius = 1;
    self.howToButton.layer.shadowOffset = CGSizeMake(0, 6);
    self.howToButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.howToButton.backgroundColor = [UIColor quartoWhite];
    [self.howToButton setTitle:@"Help" forState:UIControlStateNormal];
    [self.howToButton setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
    [self.howToButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.stackView addArrangedSubview:self.howToButton];
}

#pragma mark - Layouts

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
////    self.singlePlayerButton.layer.cornerRadius = self.singlePlayerButton.bounds.size.height * 1/8.f;
////    self.howToButton.layer.cornerRadius = self.howToButton.bounds.size.height * 1/8.f;
//}
//
//+ (BOOL)requiresConstraintBasedLayout {
//    return YES;
//}

- (void)constraintStackView {
    [self.stackView.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.topAnchor constant:200].active = YES;
    [self.stackView.leftAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leftAnchor].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor constant:-200].active = YES;
    [self.stackView.rightAnchor constraintEqualToAnchor:self.layoutMarginsGuide.rightAnchor].active = YES;
}

- (void)constraintSinglePlayerButton {
//    [self.singlePlayerButton.heightAnchor constraintEqualToConstant:120].active = YES;
    [self.singlePlayerButton.leftAnchor constraintEqualToAnchor:self.titleLabel.leftAnchor].active = YES;
    [self.singlePlayerButton.rightAnchor constraintEqualToAnchor:self.titleLabel.rightAnchor].active = YES;
}

- (void)constraintHowToButton {
    //    [self.singlePlayerButton.heightAnchor constraintEqualToConstant:120].active = YES;
    [self.howToButton.leftAnchor constraintEqualToAnchor:self.titleLabel.leftAnchor].active = YES;
    [self.howToButton.rightAnchor constraintEqualToAnchor:self.titleLabel.rightAnchor].active = YES;
}

- (void)updateConstraints {
    if (_didSetupConstraints) {
        [super updateConstraints];
        return;
    }
    
    [self constraintStackView];
    [self constraintSinglePlayerButton];
    [self constraintHowToButton];
    
    _didSetupConstraints = YES;
    [super updateConstraints];
}



@end
