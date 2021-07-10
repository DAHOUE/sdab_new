import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/ficheTechnique/Component/body.dart';

class FicheScreen extends StatelessWidget {
  final fiche;

  const FicheScreen({Key key, this.fiche}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),
        iconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Body(fiche:fiche),
    );
  }
}
