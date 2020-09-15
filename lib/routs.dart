import 'package:flutter/widgets.dart';
import 'package:namaz_project_x/screens/choose_location.dart';
import 'package:namaz_project_x/screens/demo_home.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time.dart';
import 'package:namaz_project_x/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ChooseLocation.routeName: (context) => ChooseLocation(),
  PrayerTime.routeName: (context) => PrayerTime(),
  DemoHome.routeName: (context) => DemoHome(),
};
