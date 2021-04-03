import 'package:flutter/material.dart';
import 'package:sdab_new/constants.dart';

class Background extends StatelessWidget {
  final Widget child1;
  final Widget child2;

  Background({
    Key key,
    this.child1,
    this.child2
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(40.0),
            width: size.width,
            child: child1,
          ),
          Container(
            color: color_green,
            height: size.width * 0.50,
            width: size.width,
            child: child2,
          ),
        ],
    );
  }
}
