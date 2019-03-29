//
//  SoundManager.h
//  QuartoXD
//
//  Created by Aung Moe on 12/18/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SoundManager : NSObject
+ (void)setupAVAudioSession;
+ (void)tick;
+ (void)playSound:(NSString *)fileName fileExtension:(NSString *)extension fileTypeHint:(AVFileType)fileTypeHint;
@end

NS_ASSUME_NONNULL_END
