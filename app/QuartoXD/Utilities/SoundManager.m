//
//  SoundManager.m
//  QuartoXD
//
//  Created by Aung Moe on 12/18/18.
//  Copyright © 2018 Aung Moe. All rights reserved.
//

#import "SoundManager.h"

@interface SoundManager()
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
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

+ (void)playSound:(NSString *)fileName fileExtension:(NSString *)extension fileTypeHint:(AVFileType)fileTypeHint{
  NSURL* url = [NSBundle.mainBundle URLForResource:fileName withExtension:extension];
  [SoundManager instance].audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url fileTypeHint:fileTypeHint error:nil];
  [[SoundManager instance].audioPlayer play];
}

+ (void)tick {
  [SoundManager playSound:@"Tick" fileExtension:@"mp3" fileTypeHint:AVFileTypeMPEGLayer3];
}

@end
