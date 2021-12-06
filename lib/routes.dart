import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/screen/auth/auth_screen.dart';
import 'package:travel_app/ui/screen/home/home_screen.dart';
import 'package:travel_app/ui/screen/new_trip/mew.dart';
import 'package:travel_app/ui/screen/splash_screen.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver =
    RouteObserver<PageRoute<dynamic>>();

final Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext)>{
  SPLASH: (BuildContext context) => SplashScreen(),
  MEW: (BuildContext context) => Mew(),
  HOME: (BuildContext context) => HomeScreen(),
      AUTH: (BuildContext context) => AuthScreen(),
      // LOGIN: (BuildContext context) => LoginScreen(),
      // SIGNUP: (BuildContext context) => SignUpScreen(),

  // COVID: (BuildContext context) => CovidScreen(),
};
