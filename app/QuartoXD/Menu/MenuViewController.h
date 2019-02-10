//
//  MenuViewController.h
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MenuViewController : UIViewController <MenuViewDelegate>

@property (strong, nonatomic) MenuView *view;

@end

NS_ASSUME_NONNULL_END
