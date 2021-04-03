import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/SplashScreen/Component/body.dart';
import 'package:sdab_new/Screen/Welcome/welcome_screen.dart';
import 'package:sdab_new/constants.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<SplashScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration = Duration(seconds: 10);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_green,
      body: Body(),
    );
  }
}
