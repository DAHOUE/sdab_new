import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/mesFiches/Component/body.dart';
import 'package:sdab_new/constants.dart' as constants;

class MesFichesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Mes fiches techniques"),
      //   iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: constants.color_green,
      //   elevation: 0.0,
      // ),
      body: Body(),
    );
  }
}
