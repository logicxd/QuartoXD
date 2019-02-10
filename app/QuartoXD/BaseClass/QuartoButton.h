//
//  QuartoButton.h
//  QuartoXD
//
//  Created by Aung Moe on 12/15/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuartoButton;

NS_ASSUME_NONNULL_BEGIN

@protocol QuartoButtonDelegate <NSObject>
- (void)performButtonActionWithButton:(QuartoButton *)button;
- (void)touchDownEventFromButton:(QuartoButton *)button;
- (void)touchUpEventFromButton:(QuartoButton *)button;
@end

@interface QuartoButton : UIButton
@property (weak, nonatomic) id<QuartoButtonDelegate> delegate;
- (instancetype)initWithTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
