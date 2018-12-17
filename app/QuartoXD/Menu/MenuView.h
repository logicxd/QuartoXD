//
//  MenuView.h
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../BaseClass/QuartoButton.h"

NS_ASSUME_NONNULL_BEGIN

// Forward declarations
@class MenuView;

@protocol MenuViewDelegate
- (void)buttonPressedSinglePlayer;
- (void)buttonPressedVersus;
@end

@interface MenuView : UIView <QuartoButtonDelegate>
@property (nonatomic, weak) id<MenuViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
