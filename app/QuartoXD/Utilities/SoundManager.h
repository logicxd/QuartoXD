//
//  SoundManager.h
//  QuartoXD
//
//  Created by Aung Moe on 12/18/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AVAudioPlayer; 

@interface SoundManager : NSObject

+ (void)setupAVAudioSession;
+ (void)playSound:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
