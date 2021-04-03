import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdab_new/Components/rounded_button.dart';
import 'package:sdab_new/Components/rounded_text_button.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/Login/login_screen.dart';
import 'package:sdab_new/Screen/Welcome/Component/background.dart';
import 'package:sdab_new/constants.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child1: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/IMG-20210325-WA0017.jpg", height: size.width * 0.50,),
          TextWithStyle(text: "Connectez-vous sur votre compte",
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.05),
          Divider(thickness: 5,
            height: 30,
            color: color_green,
            endIndent: size.width * 0.80,),
          TextWithStyle(text: "Pour accéder aux fonctionnalités importantes de l'application",
            fontSize: size.height * 0.03,
          ),
        ],
      ),

      child2: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedTextButton(text: "Connectez-vous ici",)
          ],
        ),
      ),
    );
  }
}
