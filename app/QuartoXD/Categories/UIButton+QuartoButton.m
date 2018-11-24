//
//  UIButton+QuartoButton.m
//  QuartoXD
//
//  Created by David Moe on 11/24/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "UIButton+QuartoButton.h"

@implementation UIButton (QuartoButton)

- (void)quartoAddShadow {
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowRadius = 1;
    self.layer.shadowOffset = CGSizeMake(0, 6);
}

@end
