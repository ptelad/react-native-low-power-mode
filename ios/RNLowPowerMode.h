#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RNLowPowerMode : RCTEventEmitter <RCTBridgeModule>
- (void)powerStateChanged;
@end
