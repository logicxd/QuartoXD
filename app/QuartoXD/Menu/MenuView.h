//
//  MenuView.h
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartoButton.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MenuViewDelegate
- (void)buttonPressedSinglePlayer;
- (void)buttonPressedVersus;
@end

@interface MenuView : UIView <QuartoButtonDelegate>
@property (weak, nonatomic) id<MenuViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
