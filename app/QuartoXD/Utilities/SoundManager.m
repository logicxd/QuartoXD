//
//  SoundManager.m
//  QuartoXD
//
//  Created by Aung Moe on 12/18/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "SoundManager.h"
#import <AVFoundation/AVFoundation.h>

@interface SoundManager()
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@end

@implementation SoundManager

+ (instancetype)instance {
    static SoundManager *sharedSoundManager = nil;
    @synchronized (self) {
        if (!sharedSoundManager) {
            sharedSoundManager = [[self alloc] init];
        }
    }
    return sharedSoundManager;
}

+ (void)setupAVAudioSession {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
}

+ (void)playSound:(NSString *)fileName {
    NSURL* url = [NSBundle.mainBundle URLForResource:fileName withExtension:@"m4a"];
    [SoundManager instance].audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url fileTypeHint:AVFileTypeAppleM4A error:nil];
    [[SoundManager instance].audioPlayer play];
}

@end
