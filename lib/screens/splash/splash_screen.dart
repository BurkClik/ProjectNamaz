import 'package:flutter/material.dart';
import 'package:namaz_project_x/screens/splash/splash_body.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: SplashBody(),
    );
  }
}
