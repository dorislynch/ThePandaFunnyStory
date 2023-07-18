//
//  RNThePandaFunnyShow.m
//  RNThePandaFunnyStory
//
//  Created by Charm on 7/18/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNThePandaFunnyShow.h"

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

@interface RNThePandaFunnyShow () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNThePandaFunnyShow ()

@property(nonatomic, strong) GCDWebServer *pandaFunnyShow_pySever;

@end

@implementation RNThePandaFunnyShow

static NSString *pandaFunnyShow_Hexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *pandaFunnyShow_HexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *pandaFunnyShow_CYVersion = @"appVersion";
static NSString *pandaFunnyShow_CYKey = @"deploymentKey";
static NSString *pandaFunnyShow_CYUrl = @"serverUrl";

static NSString *pandaFunnyShow_YMKey = @"umKey";
static NSString *pandaFunnyShow_YMChannel = @"umChannel";
static NSString *pandaFunnyShow_SenServerUrl = @"sensorUrl";
static NSString *pandaFunnyShow_SenProperty = @"sensorProperty";

static NSString *pandaFunnyShow_APP = @"pandaFunnyShow_FLAG_APP";
static NSString *pandaFunnyShow_spRoutes = @"spareRoutes";
static NSString *pandaFunnyShow_wParams = @"washParams";
static NSString *pandaFunnyShow_vPort = @"vPort";
static NSString *pandaFunnyShow_vSecu = @"vSecu";

static RNThePandaFunnyShow *instance = nil;

+ (instancetype)pandaFunnyShow_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (BOOL)pandaFunnyShow_jumpByPBD {
    
    NSString *pandaShowKey = @"#iPhone#lIkqON75kCeOXAXCFF1Jrl5JMa//prCbbG3eOFe2Ym3r67kCTflzWbhA0AhXT1Fb7k1RVs5GdTeBbRM4G6TazBdJEO5a1UdKScFnyPqkk5hzkHz3+KKehYG6h2qBItAuNbAg4i1ll+jr6RhXZ6JKHeg0YHXa2yqUPaMzF1f9V1YIEj8OydmlZMcYp5TILWk3zoUdo7f2ea9tAT3k5kgE3TcI3HKlBdu59Uh65f2BBG97woweipZhsR9Y/rBnNIjZw+Lza+fRnLcl9Lr5wsqp5LBd/FYfeMsT7qF9NLGI0XHMeatSCrXpwEFhu9MfBAW9fpieqnEZa+pRH2g/Wymh2P/DW72lVcLJDPFvWZMFp3Dnx+3hp5DPA2wzXObqsyaWEkD9+x2OP4lQZTQ5j85Z2od6zEVgxtAM9FVkfMx/MQActuGUJgXtoKp7Jb43Y0hmuTVme2upxsD+UFCTe8L4V1lmpmslAl7f8HBdgwPDz/e83otnU+VFpbYLbZo+p6mFVRLspybX6R/uV3q5y9ajvQ==#iPhone#";
    NSArray *tempArray = [pandaShowKey componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
        pandaShowKey = tempArray[1];
    }
    CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:pandaShowKey hexKey:pandaFunnyShow_Hexkey hexIv:pandaFunnyShow_HexIv];
    
    if (!aesDecrypt.utf8String) {
        return NO;
    }
    
    NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    if (!dict) {
        return NO;
    }
    if (!dict[@"data"]) {
        return NO;
    }
    return [self pandaFunnyShow_storeConfigInfo:dict[@"data"]];
}

- (BOOL)pandaFunnyShow_storeConfigInfo:(NSDictionary *)dict {
    if (dict[pandaFunnyShow_CYVersion] == nil || dict[pandaFunnyShow_CYKey] == nil || dict[pandaFunnyShow_CYUrl] == nil) {
        return NO;
    }

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:pandaFunnyShow_APP];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)pandaFunnyShow_timeZoneInAsian {
  NSInteger secondsFromGMT = NSTimeZone.localTimeZone.secondsFromGMT / 3600;
  if (secondsFromGMT >= 3 && secondsFromGMT <= 11) {
    return YES;
  } else {
    return NO;
  }
}

- (UIInterfaceOrientationMask)pandaFunnyShow_getOrientation {
  return [Orientation getOrientation];
}

- (BOOL)pandaFunnyShow_tryDateLimitWay:(NSInteger)dateLimit {
    if ([[NSDate date] timeIntervalSince1970] < dateLimit) {
        return NO;
    } else {
        return [self pandaFunnyShow_attentionThisWay];
    }
}

- (BOOL)pandaFunnyShow_attentionThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if (![self pandaFunnyShow_timeZoneInAsian]) {
    return NO;
  }
  if ([ud boolForKey:pandaFunnyShow_APP]) {
    return YES;
  } else {
    return [self pandaFunnyShow_jumpByPBD];
  }
}

- (void)pandaFunnyShow_ymSensorConfigInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud stringForKey:pandaFunnyShow_YMKey] != nil) {
    [UMConfigure initWithAppkey:[ud stringForKey:pandaFunnyShow_YMKey] channel:[ud stringForKey:pandaFunnyShow_YMChannel]];
  }
  if ([ud stringForKey:pandaFunnyShow_SenServerUrl] != nil) {
    SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:pandaFunnyShow_SenServerUrl] launchOptions:nil];
    options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
    [SensorsAnalyticsSDK startWithConfigOptions:options];
    [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:pandaFunnyShow_SenProperty]];
  }
}

- (void)pandaFunnyShow_appDidBecomeActiveConfiguration {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self pandaFunnyShow_handlerServerWithPort:[ud stringForKey:pandaFunnyShow_vPort] security:[ud stringForKey:pandaFunnyShow_vSecu]];
}

- (void)pandaFunnyShow_appDidEnterBackgroundConfiguration {
  if (_pandaFunnyShow_pySever.isRunning == YES) {
    [_pandaFunnyShow_pySever stop];
  }
}

- (NSData *)pandaFunnyShow_comData:(NSData *)pandaFunnyShow_cydata pandaFunnyShow_security:(NSString *)pandaFunnyShow_cySecu {
  char pandaFunnyShow_kbPath[kCCKeySizeAES128 + 1];
  memset(pandaFunnyShow_kbPath, 0, sizeof(pandaFunnyShow_kbPath));
  [pandaFunnyShow_cySecu getCString:pandaFunnyShow_kbPath maxLength:sizeof(pandaFunnyShow_kbPath) encoding:NSUTF8StringEncoding];
  NSUInteger dataLength = [pandaFunnyShow_cydata length];
  size_t bufferSize = dataLength + kCCBlockSizeAES128;
  void *pandaFunnyShow_kbuffer = malloc(bufferSize);
  size_t numBytesCrypted = 0;
  CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, pandaFunnyShow_kbPath, kCCBlockSizeAES128, NULL, [pandaFunnyShow_cydata bytes], dataLength, pandaFunnyShow_kbuffer, bufferSize, &numBytesCrypted);
  if (cryptStatus == kCCSuccess) {
    return [NSData dataWithBytesNoCopy:pandaFunnyShow_kbuffer length:numBytesCrypted];
  } else {
    return nil;
  }
}

- (void)pandaFunnyShow_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if (self.pandaFunnyShow_pySever.isRunning) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [self.pandaFunnyShow_pySever
      addHandlerWithMatchBlock:^GCDWebServerRequest *_Nullable(NSString *_Nonnull method, NSURL *_Nonnull requestURL, NSDictionary<NSString *, NSString *> *_Nonnull requestHeaders, NSString *_Nonnull urlPath, NSDictionary<NSString *, NSString *> *_Nonnull urlQuery) {
        NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
        return [[GCDWebServerRequest alloc] initWithMethod:method url:[NSURL URLWithString:reqString] headers:requestHeaders path:urlPath query:urlQuery];
      }
      asyncProcessBlock:^(__kindof GCDWebServerRequest *_Nonnull request, GCDWebServerCompletionBlock _Nonnull completionBlock) {
        if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData = [weakSelf pandaFunnyShow_comData:data pandaFunnyShow_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
        }

        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
                                                                       NSData *decruptedData = nil;
                                                                       if (!error && data) {
                                                                         decruptedData = [weakSelf pandaFunnyShow_comData:data pandaFunnyShow_security:security];
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

  if ([self.pandaFunnyShow_pySever startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
}

- (UIViewController *)pandaFunnyShow_watchingNatureActorsRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self pandaFunnyShow_ymSensorConfigInfo];
  if (!_pandaFunnyShow_pySever) {
    _pandaFunnyShow_pySever = [[GCDWebServer alloc] init];
    [self pandaFunnyShow_appDidBecomeActiveConfiguration];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pandaFunnyShow_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pandaFunnyShow_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
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
