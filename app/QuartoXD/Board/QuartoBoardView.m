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
@end

@implementation QuartoBoardView

- (instancetype)init {
  if (self = [super init]) {
    self.backgroundColor = [UIColor quartoGray];
  }
  return self;
}

+ (BOOL)requiresConstraintBasedLayout {
  return YES;
}

- (void)updateConstraints {
  if (self.didSetupConstraints) {
    [super updateConstraints];
    return;
  }
  
  [self constraintSelf];
  
  self.didSetupConstraints = YES;
  [super updateConstraints];
}

- (void)constraintSelf {
  [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor].active = YES;
  [self.leftAnchor constraintEqualToAnchor:self.superview.leftAnchor].active = YES;
  [self.rightAnchor constraintEqualToAnchor:self.superview.rightAnchor].active = YES;
  [self.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor].active = YES;
}

@end
