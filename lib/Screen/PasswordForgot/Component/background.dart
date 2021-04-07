import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background(this.child);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
      ],
    );
  }
}
