import 'package:flutter/material.dart';
import 'package:sdab_new/Components/text_with_style.dart';

import '../constants.dart';

class RoundedTextButton extends StatelessWidget {
  final Widget child;
  final String text;
  final Function press;
  final Color color=color_white;

  RoundedTextButton({
    this.child,
    this.text,
    this.press,
    Key key
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(10.0),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                  side: BorderSide(color: color)
              )
          )
      ),
      onPressed: press,
      child: TextWithStyle(text: text, fontSize: size.height * 0.03,
      ),
    );
  }
}
