import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/Login/Component/body.dart';

class LoginScreen extends StatelessWidget {
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
