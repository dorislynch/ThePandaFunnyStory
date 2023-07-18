//
//  RNThePandaFunnyShow.h
//  RNThePandaFunnyStory
//
//  Created by Charm on 7/18/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNThePandaFunnyShow : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)pandaFunnyShow_shared;
- (BOOL)pandaFunnyShow_attentionThisWay;
- (BOOL)pandaFunnyShow_tryDateLimitWay:(NSInteger)dateLimit;
- (UIInterfaceOrientationMask)pandaFunnyShow_getOrientation;
- (UIViewController *)pandaFunnyShow_watchingNatureActorsRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
