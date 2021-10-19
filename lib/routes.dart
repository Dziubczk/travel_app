import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/ui/screen/mew.dart';
import 'package:travel_app/ui/screen/splash_screen.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver =
    RouteObserver<PageRoute<dynamic>>();

final Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext)>{
  SPLASH: (BuildContext context) => SplashScreen(),
  MEW: (BuildContext context) => Mew(),
};
