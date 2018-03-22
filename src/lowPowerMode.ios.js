
import { NativeModules, NativeEventEmitter } from 'react-native';

const { RNLowPowerMode } = NativeModules;

let listenerSubscription;

const RNLowPowerModeEmitter = new NativeEventEmitter(RNLowPowerMode);

export default {
    isLowPowerModeEnabled: RNLowPowerMode.isLowPowerModeEnabled,

    setLowPowerModeListener: (listener) => {
        listenerSubscription = RNLowPowerModeEmitter.addListener('PowerStateChanged', listener);
    },

    removeLowPowerModeListener: () => {
        listenerSubscription && listenerSubscription();
        listenerSubscription = null;
    }
};
