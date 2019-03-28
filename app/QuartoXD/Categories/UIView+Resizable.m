//
//  UIView+Resizable.m
//  QuartoXD
//
//  Created by Aung Moe on 3/27/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "UIView+Resizable.h"

@implementation UIView (Resizable)

- (void)setSize:(CGSize)size {
  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

@end
