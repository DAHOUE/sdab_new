import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/Register/Component/body.dart';



// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _RegisterScreen createState() => _RegisterScreen();
// }


class  RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(""),
        iconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Body(),
    );
  }
}
