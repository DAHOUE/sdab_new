import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Color color;
  final Widget child;

  Background({
    Key key,
    this.color,
    this.child

}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child
        ],
      ),
    );
  }
}
