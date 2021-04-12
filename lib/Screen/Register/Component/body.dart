import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdab_new/Components/rounded_button.dart';
import 'package:sdab_new/Components/rounded_text_button.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/Filtrage/filtrage_screen.dart';
import 'package:sdab_new/Screen/Login/login_screen.dart';
import 'package:sdab_new/Screen/SplashScreen/Component/background.dart';
import 'package:sdab_new/Screen/campagne/campagne_screen.dart';
import 'package:sdab_new/Screen/ficheTechnique/fiche_screen.dart';
import 'package:sdab_new/constants.dart' as constants;

class Body extends StatefulWidget {
  Body({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Body createState () => _Body();
}



class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> titre= ["Producteur", "Transformateur", "Commerçant"];
    Key key = new Key("value");
    String dropdownvalue="";
    int _valu = 1;
    return SingleChildScrollView(
      physics: new AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Image.asset("assets/IMG-20210325-WA0017.jpg", height: size.width * 0.50,),),
          Center(
            child: TextWithStyle(
              text: "S'inscrire",
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Nom",
                labelStyle: TextStyle(color: Colors.black54),

              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Prénom",
                labelStyle: TextStyle(color: Colors.black54),

              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child:  TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Numéro de téléphone",
                hintText: "+229 55 26 58 00",
                labelStyle: TextStyle(color: Colors.black54),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),

            child:  DropdownButtonFormField(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),

              value: _valu,
              isDense: true,
              items: [

                DropdownMenuItem(child: Text("Producteur"), value: 1,),
                DropdownMenuItem(child: Text("Transformateur"), value: 2,),
                DropdownMenuItem(child: Text("Commerçant"), value: 3,),
              ],
              onChanged: (value){
                setState(() {
                  _valu = value;


                });
                print(_valu);
              },
              decoration: InputDecoration(
                  labelText: "Statut",
                  labelStyle: TextStyle(color: Colors.black54)
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
            child: ListTile(
              subtitle: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mots de passe",
                  labelStyle: TextStyle(color: Colors.black54),

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
            child: ListTile(
              subtitle: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmer le mot de passe",
                  labelStyle: TextStyle(color: Colors.black54),

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
            child: TextButton(
              onPressed: versPage,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.ac_unit,
                    size: 30.0,
                    color: Colors.white,),
                  Text(
                    "Inscription",
                    style: TextStyle(color: Colors.white),
                  )],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(constants.color_green),
                elevation: MaterialStateProperty.all(15.0),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWithStyle(text: "Vous avez déjà un compte?",),
                TextButton(onPressed: versPageConnexion,
                  child: Text("Connectez-vous",
                    style: TextStyle(color: constants.color_green),

                  ),)
              ],),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Container(height: 5.0,
                width: 150,
                decoration: BoxDecoration(
                    color: constants.color_green,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),),
            ),
          )



        ],
      ),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    Body();
  }

  void versPageConnexion() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return LoginScreen();
    }));
  }

  void versPage (){
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return FiltrageScreen();
    }));
  }


}
