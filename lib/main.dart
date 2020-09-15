import 'package:flutter/material.dart';
import 'package:namaz_project_x/routs.dart';
import 'package:namaz_project_x/screens/splash/splash_screen.dart';
import 'package:namaz_project_x/theme/theme.dart';

/// TODO:
///   []  Splash Screen'in uygulamanın ilk açılışta çıkmasını sağla
///   [x]  Şehir seçim ekranından sonra geri dönüş yok
///   []  Splash Screen'e düzgün resim ve yazılar bul
///   []  Kaza namazı sayacı
///   []  Kıble bulmaz
///   []  Zikirmatik
///   []  Home ekranında location pop-up ile location güncelleme
///   []  Vakit çıkma süresi interaktif olmalı
///   []  appBar ana zamanda sıradaki zamanı göstermeli

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
