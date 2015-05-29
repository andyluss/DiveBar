App.info({
  name: '潜途',
  description: '一个潜水相关的软件',
  author: 'divebar',
  email: 'root@divebar.com',
  website: 'http://divebar.com',
  version: '2.2.1'
});

App.icons({
  // iOS
  'iphone': 'resources/icons/icon-60.png',
  'iphone_2x': 'resources/icons/icon-60@2x.png',
  'iphone_3x': 'resources/icons/icon-60@3x.png',
  'ipad': 'resources/icons/icon-76.png',
  'ipad_2x': 'resources/icons/icon-76@2x.png',

  // Android
  'android_ldpi': 'resources/icons/icon-36.png',
  'android_mdpi': 'resources/icons/icon-48.png',
  'android_hdpi': 'resources/icons/icon-72.png',
  'android_xhdpi': 'resources/icons/icon-96.png'
});

App.launchScreens({
  // iOS
  'iphone': 'resources/splash/iphone/Default.png',
  'iphone_2x': 'resources/splash/iphone/Default@2x.png',
  'iphone5': 'resources/splash/iphone/Default-568h@2x.png',
  'iphone6': 'resources/splash/iphone/Default-667h@2x.png',
  'iphone6p_portrait': 'resources/splash/iphone/Default-Portrait-736h@3x.png',
  'ipad_portrait': 'resources/splash/iphone/Default-Portrait.png',
  'ipad_portrait_2x': 'resources/splash/iphone/Default-Portrait@2x.png',

  // Android
  'android_ldpi_portrait': 'resources/splash/android/images/res-long-port-ldpi/default.png',
  'android_mdpi_portrait': 'resources/splash/android/images/res-long-port-mdpi/default.png',
  'android_hdpi_portrait': 'resources/splash/android/images/res-long-port-hdpi/default.png',
  'android_xhdpi_portrait': 'resources/splash/android/images/res-long-port-xhdpi/default.png'
});

//App.setPreference('StatusBarOverlaysWebView', 'false');
//App.setPreference('StatusBarBackgroundColor', '#000000');

App.accessRule("*");