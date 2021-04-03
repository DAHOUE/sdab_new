import 'package:flutter/material.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/SplashScreen/Component/background.dart';
import 'package:sdab_new/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      color: color_green,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/IMG-20210325-WA0010.jpg"),
            ),
            Container(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                //backgroundColor: Colors.white,
                valueColor: new AlwaysStoppedAnimation<Color>(color_white),
                strokeWidth: 6,

              ),
            )
          ],
        ),
      )
      ,
    );
  }
}
