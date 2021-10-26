import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      // home: HideOnScroll(),
      initialRoute: SPLASH,
      routes: routes,
      navigatorObservers: <NavigatorObserver>[routeObserver],
    );
  }
}
