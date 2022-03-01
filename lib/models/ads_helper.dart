import 'dart:io';


class AdsHelper{
  static String get bannerAdUnitId {
    if(Platform.isAndroid)
      return 'ca-app-pub-1229600046040111/5538199965';
      //return 'ca-app-pub-3940256099942544/6300978111';//test
    else if(Platform.isIOS)
      return 'ca-app-pub-1229600046040111/4139153111';
    else
      throw UnsupportedError("unsupported platform");
  }

  static String get inlineAdUnitId {
    if(Platform.isAndroid)
      return 'ca-app-pub-1229600046040111/2976874980';
      //return 'ca-app-pub-3940256099942544/6300978111';//test
    else if(Platform.isIOS)
      return 'ca-app-pub-1229600046040111/4139153111';
    else
      throw UnsupportedError("unsupported platform");
  }

  static String get InterstitialAdUnitId {
    if(Platform.isAndroid)
      return 'ca-app-pub-1229600046040111/7524277047';
      //return 'ca-app-pub-3940256099942544/1033173712';//test
    else if(Platform.isIOS)
      return 'ca-app-pub-1229600046040111/4139153111';
    else
      throw UnsupportedError("unsupported platform");
  }

}