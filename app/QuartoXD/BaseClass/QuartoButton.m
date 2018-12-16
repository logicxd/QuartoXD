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

@implementation QuartoButton

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor quartoWhite];
        [self quartoAddShadow];
        [self setTitle:@"Single" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor quartoBlack] forState:UIControlStateNormal];
//        [self addTarget:self action:@selector(singlePlayerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.titleLabel.font = [UIFont quartoButtonMenu];
    }
    return self;
}

@end
