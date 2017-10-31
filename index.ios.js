
import { NativeModules, NativeEventEmitter } from 'react-native';

const { RNLowPowerMode } = NativeModules;

let listenerSubscription;

export default {
    isLowPowerModeEnabled: RNLowPowerMode.isLowPowerModeEnabled,

    setLowPowerModeListener: (listener) => {
        listenerSubscription = NativeEventEmitter.addListener('PowerStateChanged', listener);
    },

    removeLowPowerModeListener: () => {
        listenerSubscription && listenerSubscription();
        listenerSubscription = null;
    }
};
