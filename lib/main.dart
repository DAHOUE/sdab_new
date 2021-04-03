import 'package:flutter/material.dart';
import 'package:sdab_new/constants.dart';

import 'Screen/SplashScreen/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: color_white,
      title: 'e-pineA',
      /*theme: ThemeData(
        primaryColor: color_green,
        scaffoldBackgroundColor: Colors.white,
      ),*/
      home: SplashScreen(),
    );
  }
}