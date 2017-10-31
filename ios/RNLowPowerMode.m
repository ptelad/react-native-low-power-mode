
#import "RNLowPowerMode.h"

@implementation RNLowPowerMode
{
    bool hasListeners;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents {
    return @[@"PowerStateChanged"];
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    hasListeners = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector: @selector(powerStateChanged)
                                                 name: NSProcessInfoPowerStateDidChangeNotification
                                               object: nil];
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    hasListeners = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)powerStateChanged {
    if (hasListeners) {
        NSNumber *res = [NSNumber numberWithBool:[[NSProcessInfo processInfo] isLowPowerModeEnabled]];
        [self sendEventWithName:@"PowerStateChanged" body:res];
    }
}

RCT_EXPORT_METHOD(isLowPowerModeEnabled:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *res = [NSNumber numberWithBool:[[NSProcessInfo processInfo] isLowPowerModeEnabled]];
    resolve(res);
}

@end
  
