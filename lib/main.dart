import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:restaurants/Featares/Register_screen/Presentation/pages/register.dart';
import 'package:restaurants/Featares/Splash_screen/Presentation/splash_screen.dart';

import 'Featares/Seting_Screen/Presentation/cubit/loce_cubit.dart';
import 'Featares/Seting_Screen/Presentation/cubit/loce_state.dart';
import 'Featares/login_screen/Presentation/pages/Login_screen.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
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
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },

            // supportedLocales: S.delegate.supportedLocales,

            // locale: Locale(LoginCubit.langCode),
            debugShowCheckedModeBanner: false,

            //locale: Locale.fromSubtags(languageCode: "ar"),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
