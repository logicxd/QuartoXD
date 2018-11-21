//
//  MenuView.h
//  QuartoXD
//
//  Created by Aung Moe on 11/4/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MenuButtonType){
    MenuButtonTypeSingle,
    MenuButtonTypeVersus,
    MenuButtonTypeHowTo
};

// Forward declarations
@class MenuView;

@protocol MenuViewDelegate <NSObject>
- (void)buttonPressedSinglePlayer;
- (void)buttonPressedVersus;
- (void)buttonPressedHowTo;
@end

@interface MenuView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *singlePlayerButton;
@property (nonatomic, strong) UIButton *versusButton;
@property (nonatomic, strong) UIButton *howToButton;
@end

NS_ASSUME_NONNULL_END
