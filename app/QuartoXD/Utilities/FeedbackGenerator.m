//
//  FeedbackGenerator.m
//  QuartoXD
//
//  If feedback performance is not desirable, try to optimize by using [prepare]
//  before using any of these methods. Will need to refactor.
//
//  Created by David Moe on 2/9/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import "FeedbackGenerator.h"
#import <UIKit/UIKit.h>

static NSString * const kImpactLight = @"kImpactLight";
static NSString * const kImpactMedium = @"kImpactMedium";
static NSString * const kImpactHeavy = @"kImpactHeavy";
static NSString * const kNotificationFeedback = @"kNotificationFeedback";

@interface FeedbackGenerator()
@property (strong, nonatomic) NSMutableDictionary *generators;
@end

@implementation FeedbackGenerator

#pragma mark - Lifecycle

+ (instancetype)instance {
  static FeedbackGenerator *feedbackGenerator = nil;
  @synchronized (self) {
    if (!feedbackGenerator) {
      feedbackGenerator = [[self alloc] init];
      feedbackGenerator.generators = [[NSMutableDictionary alloc] initWithCapacity:6];
    }
  }
  return feedbackGenerator;
}

+ (void)reset {
  [[FeedbackGenerator instance].generators removeAllObjects];
}

#pragma mark - Feedback Generator

+ (void)impactOccurredLight {
  UIImpactFeedbackGenerator *feedback = [[FeedbackGenerator instance].generators objectForKey:kImpactLight];
  if (!feedback) {
    feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    [[FeedbackGenerator instance].generators setObject:feedback forKey:kImpactLight];
  }
  [feedback impactOccurred];
}

+ (void)impactOccurredMedium {
  UIImpactFeedbackGenerator *feedback = [[FeedbackGenerator instance].generators objectForKey:kImpactMedium];
  if (!feedback) {
    feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
    [[FeedbackGenerator instance].generators setObject:feedback forKey:kImpactMedium];
  }
  [feedback impactOccurred];
}

+ (void)impactOccurredHeavy {
  UIImpactFeedbackGenerator *feedback = [[FeedbackGenerator instance].generators objectForKey:kImpactHeavy];
  if (!feedback) {
    feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
    [[FeedbackGenerator instance].generators setObject:feedback forKey:kImpactHeavy];
  }
  [feedback impactOccurred];
}

#pragma mark - Notification Generator

+ (void)notificationOccurredSuccess {
  UINotificationFeedbackGenerator *feedback = [[FeedbackGenerator instance].generators objectForKey:kNotificationFeedback];
  if (!feedback) {
    feedback = [[UINotificationFeedbackGenerator alloc] init];
    [[FeedbackGenerator instance].generators setObject:feedback forKey:kNotificationFeedback];
  }
  [feedback notificationOccurred:UINotificationFeedbackTypeSuccess];
}

+ (void)notificationOccurredWarning {
  UINotificationFeedbackGenerator *feedback = [[FeedbackGenerator instance].generators objectForKey:kNotificationFeedback];
  if (!feedback) {
    feedback = [[UINotificationFeedbackGenerator alloc] init];
    [[FeedbackGenerator instance].generators setObject:feedback forKey:kNotificationFeedback];
  }
  [feedback notificationOccurred:UINotificationFeedbackTypeWarning];
}

+ (void)notificationOccurredError {
  UINotificationFeedbackGenerator *feedback = [[FeedbackGenerator instance].generators objectForKey:kNotificationFeedback];
  if (!feedback) {
    feedback = [[UINotificationFeedbackGenerator alloc] init];
    [[FeedbackGenerator instance].generators setObject:feedback forKey:kNotificationFeedback];
  }
  [feedback notificationOccurred:UINotificationFeedbackTypeError];
}

@end
