
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
        if ([[NSProcessInfo processInfo] isLowPowerModeEnabled]) {
            // Low Power Mode is enabled. Start reducing activity to conserve energy.
            [self sendEventWithName:@"PowerStateChanged" body:@{@"lowPowerMode": @YES}];
        } else {
            // Low Power Mode is not enabled.
            [self sendEventWithName:@"PowerStateChanged" body:@{@"lowPowerMode": @NO}];
        };
    }
}

RCT_EXPORT_METHOD(isLowPowerModeEnabled:
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSNumber *res = [NSNumber numberWithBool:[[NSProcessInfo processInfo] isLowPowerModeEnabled]];
    resolve(res);
}

@end
  
