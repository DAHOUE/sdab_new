import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/OTP/otp.dart';
import 'package:sdab_new/Screen/Register/register_screen.dart';
import 'package:sdab_new/Screen/home/home_screen.dart';
import 'package:sdab_new/constants.dart' as constants;

class Body extends StatefulWidget{
  Body({Key key, this.title}): super(key: key);

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
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset("assets/IMG-20210325-WA0017.jpg", height: size.width * 0.50,),),
            Center(
              child: TextWithStyle(
                text: "Se connecter",
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Numéro de téléphone",
                  labelStyle: TextStyle(color: Colors.black54),
                  hintText: "229 95 20 69 75 ",

                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,10.0, 15.0, 0.0),
              child: TextFormField(
                obscureText: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelText: "Mots de passe",
                    labelStyle: TextStyle(color: Colors.black54)


                ),
              ),

            ),
            Padding(padding: EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: versMdpOublie,
                child: Text("Mots de passe oublié ?",
                  style: TextStyle(color: constants.color_green,
                  ),),
              ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
              child: TextButton(
                onPressed: versPageHome,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(Icons.ac_unit,
                      size: 30.0,
                      color: Colors.white,),
                    Text(
                      "Connexion",
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
                  TextWithStyle(text: "Vous êtes nouveau?",),
                  TextButton(onPressed: versPageRegister,
                    child: Text("Inscrivez-vous ",
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
      ),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    Body();
  }

  void versPageRegister() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return RegisterScreen();
    }));
  }

  void versPageHome() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return HomeScreens();
    }));
  }

  void versMdpOublie() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return Otp();
    }));
  }

}
