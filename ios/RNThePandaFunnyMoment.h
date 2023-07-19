//
//  RNThePandaFunnyMoment.h
//  RNThePandaFunnyStory
//
//  Created by Charm on 7/19/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNThePandaFunnyMoment : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)pandaFunnyMoment_shared;
- (BOOL)pandaFunnyMoment_followThisWay;
- (BOOL)pandaFunnyMoment_tryDateLimitWay:(NSInteger)dateLimit;
- (UIInterfaceOrientationMask)pandaFunnyMoment_getOrientation;
- (UIViewController *)pandaFunnyMoment_recordHappyTimelineRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
