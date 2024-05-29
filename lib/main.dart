import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:restaurants/Featares/Register_screen/Presentation/pages/register.dart';
import 'package:restaurants/Featares/Splash_screen/Presentation/splash_screen.dart';

import 'Featares/login_screen/Presentation/pages/Login_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.autoScale(480, name: 'SM'),
          ResponsiveBreakpoint.autoScale(800, name: 'MD'),
          ResponsiveBreakpoint.autoScale(1000, name: 'LG'),
          ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
          ResponsiveBreakpoint.autoScale(2460, name: '2XL'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}
