import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/routes.dart';
import 'package:travel_app/themes.dart';
import 'package:travel_app/utils/user_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          initialRoute: SPLASH,
          routes: routes,
          navigatorObservers: <NavigatorObserver>[routeObserver],
        ),
      ),
    );
  }
}
