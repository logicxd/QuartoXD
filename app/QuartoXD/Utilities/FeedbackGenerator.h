//
//  FeedbackGenerator.h
//  QuartoXD
//
//  Created by David Moe on 2/9/19.
//  Copyright © 2019 Aung Moe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedbackGenerator : NSObject

#pragma mark - Lifecycle

+ (void)reset;

#pragma mark - Feedback Generator

+ (void)impactOccurredLight;
+ (void)impactOccurredMedium;
+ (void)impactOccurredHeavy;

#pragma mark - Notification Generator

+ (void)notificationOccurredSuccess;
+ (void)notificationOccurredWarning;
+ (void)notificationOccurredError;

#pragma mark -

@end

NS_ASSUME_NONNULL_END
