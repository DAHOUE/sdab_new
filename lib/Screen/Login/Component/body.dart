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
  Size size ;
  List<String> titre= ["Producteur", "Transformateur", "Commerçant"];
  TextEditingController loginController = new TextEditingController();
  TextEditingController mdpController = new TextEditingController();
  String dropdownvalue="";
  int _valu = 1;
  final _formKey = new GlobalKey <FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: new AlwaysScrollableScrollPhysics(),
      child: Form(
        key: _formKey,
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
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
              child: TextFormField(
                controller: loginController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Numéro de téléphone",
                  labelStyle: TextStyle(color: Colors.black54),
                  hintText: "229 95 20 69 75 ",

                ),
                validator: (value){
                  if(value.isEmpty)
                    return ("Saisir votre noméro de téléphone");
                  else if(value.length>12)
                    return ("Saisir  un numéro correct");
                  else
                    return null;


                },
              ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0,10.0, 30.0, 0.0),
              child: TextFormField(
                controller: mdpController,
                obscureText: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    labelText: "Mots de passe",
                    labelStyle: TextStyle(color: Colors.black54)


                ),
                validator: (value){
                  if(value.isEmpty)
                    return("Saisir votre mots de passe");
                  else
                    return null;
                },
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
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: TextButton(
                onPressed: (){
                  if(_formKey.currentState.validate()) {
                    versPageHome();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset("assets/icons/register.png"),
                    ),
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

  bool contientQueDesChiffres(String value){
    if(value.startsWith('+',0) && value.length==12)
      {

      }

  }

}
