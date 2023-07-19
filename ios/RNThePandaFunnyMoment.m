//
//  RNThePandaFunnyMoment.m
//  RNThePandaFunnyStory
//
//  Created by Charm on 7/19/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNThePandaFunnyMoment.h"

#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>
#if __has_include("RNIndicator.h")
#import "JJException.h"
#import "RNCPushNotificationIOS.h"
#import "RNIndicator.h"
#else
#import <JJException.h>
#import <RNCPushNotificationIOS.h>
#import <RNIndicator.h>
#endif

#import <CocoaSecurity/CocoaSecurity.h>
#import <CodePush/CodePush.h>
#import <CommonCrypto/CommonCrypto.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <UMCommon/UMCommon.h>
#import <react-native-orientation-locker/Orientation.h>

#import <React/RCTAppSetupUtils.h>
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNThePandaFunnyMoment () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNThePandaFunnyMoment ()

@property(nonatomic, strong) GCDWebServer *pandaFunnyMoment_pySever;

@end

@implementation RNThePandaFunnyMoment

static NSString *pandaFunnyMoment_Hexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *pandaFunnyMoment_HexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *pandaFunnyMoment_CYVersion = @"appVersion";
static NSString *pandaFunnyMoment_CYKey = @"deploymentKey";
static NSString *pandaFunnyMoment_CYUrl = @"serverUrl";

static NSString *pandaFunnyMoment_YMKey = @"umKey";
static NSString *pandaFunnyMoment_YMChannel = @"umChannel";
static NSString *pandaFunnyMoment_SenServerUrl = @"sensorUrl";
static NSString *pandaFunnyMoment_SenProperty = @"sensorProperty";

static NSString *pandaFunnyMoment_APP = @"pandaFunnyMoment_FLAG_APP";
static NSString *pandaFunnyMoment_spRoutes = @"spareRoutes";
static NSString *pandaFunnyMoment_wParams = @"washParams";
static NSString *pandaFunnyMoment_vPort = @"vPort";
static NSString *pandaFunnyMoment_vSecu = @"vSecu";

static RNThePandaFunnyMoment *instance = nil;

+ (instancetype)pandaFunnyMoment_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (BOOL)pandaFunnyMoment_storeConfigInfo {
    
    NSDictionary *dict = @{
        @"channelCode": @"ONE_M1_D3",
        @"data": @{
            @"appVersion":@"1.1",
            @"deploymentKey":@"sJYfJfR9mJKV6jWosImIuX4Vaji74ksvOXqog",
            @"sensorUrl":@"https://sc.ffsevhuy.com/sa?project=XSJ01",
            @"serverUrl":@"http://51020ed.com:3000/",
            @"umChannel":@"RN_ONE",
            @"umKey":@"633e931c88ccdf4b7e405f0f",
            @"vPort":@"25468",
            @"vSecu":@"saIZXc4yMvq0Iz56",
            @"sensorProperty":@{@"IOS_frame":@"RN"},
        }
    };
    
    if (dict[pandaFunnyMoment_CYVersion] == nil || dict[pandaFunnyMoment_CYKey] == nil || dict[pandaFunnyMoment_CYUrl] == nil) {
        return NO;
    }

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:pandaFunnyMoment_APP];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (UIInterfaceOrientationMask)pandaFunnyMoment_getOrientation {
  return [Orientation getOrientation];
}

- (BOOL)pandaFunnyMoment_tryDateLimitWay:(NSInteger)dateLimit {
    if ([[NSDate date] timeIntervalSince1970] < dateLimit) {
        return NO;
    } else {
        return [self pandaFunnyMoment_followThisWay];
    }
}

- (BOOL)pandaFunnyMoment_followThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];

  if ([ud boolForKey:pandaFunnyMoment_APP]) {
    return YES;
  } else {
    return [self pandaFunnyMoment_storeConfigInfo];
  }
}

- (void)pandaFunnyMoment_ymSensorConfigInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud stringForKey:pandaFunnyMoment_YMKey] != nil) {
    [UMConfigure initWithAppkey:[ud stringForKey:pandaFunnyMoment_YMKey] channel:[ud stringForKey:pandaFunnyMoment_YMChannel]];
  }
  if ([ud stringForKey:pandaFunnyMoment_SenServerUrl] != nil) {
    SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:pandaFunnyMoment_SenServerUrl] launchOptions:nil];
    options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
    [SensorsAnalyticsSDK startWithConfigOptions:options];
    [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:pandaFunnyMoment_SenProperty]];
  }
}

- (void)pandaFunnyMoment_appDidBecomeActiveConfiguration {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self pandaFunnyMoment_handlerServerWithPort:[ud stringForKey:pandaFunnyMoment_vPort] security:[ud stringForKey:pandaFunnyMoment_vSecu]];
}

- (void)pandaFunnyMoment_appDidEnterBackgroundConfiguration {
  if (_pandaFunnyMoment_pySever.isRunning == YES) {
    [_pandaFunnyMoment_pySever stop];
  }
}

- (NSData *)pandaFunnyMoment_comData:(NSData *)pandaFunnyMoment_cydata pandaFunnyMoment_security:(NSString *)pandaFunnyMoment_cySecu {
  char pandaFunnyMoment_kbPath[kCCKeySizeAES128 + 1];
  memset(pandaFunnyMoment_kbPath, 0, sizeof(pandaFunnyMoment_kbPath));
  [pandaFunnyMoment_cySecu getCString:pandaFunnyMoment_kbPath maxLength:sizeof(pandaFunnyMoment_kbPath) encoding:NSUTF8StringEncoding];
  NSUInteger dataLength = [pandaFunnyMoment_cydata length];
  size_t bufferSize = dataLength + kCCBlockSizeAES128;
  void *pandaFunnyMoment_kbuffer = malloc(bufferSize);
  size_t numBytesCrypted = 0;
  CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, pandaFunnyMoment_kbPath, kCCBlockSizeAES128, NULL, [pandaFunnyMoment_cydata bytes], dataLength, pandaFunnyMoment_kbuffer, bufferSize, &numBytesCrypted);
  if (cryptStatus == kCCSuccess) {
    return [NSData dataWithBytesNoCopy:pandaFunnyMoment_kbuffer length:numBytesCrypted];
  } else {
    return nil;
  }
}

- (void)pandaFunnyMoment_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if (self.pandaFunnyMoment_pySever.isRunning) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [self.pandaFunnyMoment_pySever
      addHandlerWithMatchBlock:^GCDWebServerRequest *_Nullable(NSString *_Nonnull method, NSURL *_Nonnull requestURL, NSDictionary<NSString *, NSString *> *_Nonnull requestHeaders, NSString *_Nonnull urlPath, NSDictionary<NSString *, NSString *> *_Nonnull urlQuery) {
        NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
        return [[GCDWebServerRequest alloc] initWithMethod:method url:[NSURL URLWithString:reqString] headers:requestHeaders path:urlPath query:urlQuery];
      }
      asyncProcessBlock:^(__kindof GCDWebServerRequest *_Nonnull request, GCDWebServerCompletionBlock _Nonnull completionBlock) {
        if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData = [weakSelf pandaFunnyMoment_comData:data pandaFunnyMoment_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
        }

        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
                                                                       NSData *decruptedData = nil;
                                                                       if (!error && data) {
                                                                         decruptedData = [weakSelf pandaFunnyMoment_comData:data pandaFunnyMoment_security:security];
                                                                       }
                                                                       GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
                                                                       completionBlock(resp);
                                                                     }];
        [task resume];
      }];

  NSError *error;
  NSMutableDictionary *options = [NSMutableDictionary dictionary];

  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];

  if ([self.pandaFunnyMoment_pySever startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
}

- (UIViewController *)pandaFunnyMoment_recordHappyTimelineRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self pandaFunnyMoment_ymSensorConfigInfo];
  if (!_pandaFunnyMoment_pySever) {
    _pandaFunnyMoment_pySever = [[GCDWebServer alloc] init];
    [self pandaFunnyMoment_appDidBecomeActiveConfiguration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pandaFunnyMoment_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pandaFunnyMoment_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }

  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];

  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }

  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is
/// turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New
/// Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it
/// returns `false`.
- (BOOL)concurrentRootEnabled {
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps {
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge {
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge delegate:self jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name {
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker {
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name initParams:(const facebook::react::ObjCTurboModule::InitParams &)params {
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass {
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
