import 'package:flutter/material.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  //final Widget child2;

  Background({
    Key key,
    this.child,
   // this.child2
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(

        children: [
          /*Container(
            padding: EdgeInsets.all(40.0),
            width: size.width,
            child: child1,
          ),
          Row(
            children: [
              TextButton(onPressed: (){}, child: TextWithStyle(text: "Inscription",)),
              SizedBox(width: 10.0,),
              TextButton(onPressed: (){}, child: TextWithStyle(text: "Connexion",))
            ],
          ),
          Container(
            color: color_green,
            height: size.width * 0.50,
            width: size.width,
            child: child2,
          ),*/
          child
        ],
    );
  }
}
