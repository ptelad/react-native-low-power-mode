
# react-native-low-power-mode

A React-Native library to help you detect iOS's low power mode.

## Getting started

`$ npm install react-native-low-power-mode --save`

### Mostly automatic installation

`$ react-native link react-native-low-power-mode`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-low-power-mode` and add `RNLowPowerMode.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNLowPowerMode.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Usage
```javascript
import RNLowPowerMode from 'react-native-low-power-mode';

...

componentWillMount() {
    RNLowPowerMode.isLowPowerModeEnabled().then(isLowPower => {
        this.setState({isLowPower});
    });

    RNLowPowerMode.setLowPowerModeListener((isLowPower) => {
        this.setState({isLowPower});
    });
}

componentWillUnmount() {
    RNLowPowerMode.removeLowPowerModeListener();
}

```

That's it, it's that easy.

Now that you know the device is in low power mode, scale back animations and try to do less processing.

Read more about low power mode [HERE](https://developer.apple.com/library/content/documentation/Performance/Conceptual/EnergyGuide-iOS/LowPowerMode.html)

## Licence ##
**MIT**