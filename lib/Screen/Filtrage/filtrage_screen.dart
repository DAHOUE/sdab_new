import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/Filtrage/Component/body.dart';
import 'package:sdab_new/constants.dart' as constants;



// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _RegisterScreen createState() => _RegisterScreen();
// }


class  FiltrageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Option de filtrage"),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),

        backgroundColor: constants.color_green,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
