import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdab_new/Components/rounded_text_button.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/CardDynamique/card_dynamic.dart';
import 'package:sdab_new/Screen/Welcome/Component/background.dart';
import 'package:sdab_new/constants.dart';



class Body extends StatefulWidget {
  @override
  _BodyStateState createState() => _BodyStateState();
}

class _BodyStateState extends State<Body> {

  bool loginClicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            padding: EdgeInsets.all(60.0),
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/IMG-20210325-WA0017.jpg", height: size.width * 0.50,),
                TextWithStyle(text: loginClicked? "Connectez-vous sur votre compte" : "                         Créer un compte",
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.05),
                Divider(thickness: 5,
                  height: 30,
                  color: color_black,
                  endIndent: size.width * 0.60,),
                TextWithStyle(text: "Pour accéder aux fonctionnalités importantes de l'application",
                  fontSize: size.height * 0.03,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  setState(() {
                    loginClicked = false;
                  });
                }, child: TextWithStyle(text: "Inscription", colors: loginClicked ? color_black : color_green,)),
                SizedBox(width: 75.0,),
                TextButton(onPressed: (){
                  setState(() {
                    loginClicked = true;
                  });
                }, child: TextWithStyle(text: "Connexion", colors: loginClicked ? color_black : color_green,))
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: color_green,
              width: size.width,
              height: size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedTextButton(text: loginClicked ? "Connectez-vous ici" : "Inscrevez-vous ici",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Carte()));
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
