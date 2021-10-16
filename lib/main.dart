// @dart=2.9
import 'package:cool_sound/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_themes/purple_theme.dart';
import 'localization/cool_sound_translations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: CoolSoundTranslations(),
      locale: Get.deviceLocale,
      theme: purple_theme,
      home: HomeScreen()
    );
  }
}

