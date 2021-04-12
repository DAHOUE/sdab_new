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
              Card(
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                  title: TextWithStyle(
                    text: "Fiche technique 1",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: TextWithStyle(
                    text: "20/12/2016",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                  title: TextWithStyle(
                    text: "Fiche technique 2",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: TextWithStyle(
                    text: "12/02/2017",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                  title: TextWithStyle(
                    text: "Fiche technique 3",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: TextWithStyle(
                    text: "25/05/2017",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: ListTile(
                    leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                    title: TextWithStyle(
                      text: "Fiche technique 4",
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: TextWithStyle(
                      text: "12/12/2018",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: ListTile(
                    leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                    title: TextWithStyle(
                      text: "Fiche technique 5",
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: TextWithStyle(
                      text: "25/12/2018",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: ListTile(
                      leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                      title: TextWithStyle(
                        text: "Fiche technique 6",
                        fontWeight: FontWeight.bold,
                      ),
                      trailing: TextWithStyle(
                        text: "15/02/2019",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: ListTile(
                      leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                      title: TextWithStyle(
                        text: "Fiche technique 7",
                        fontWeight: FontWeight.bold,
                      ),
                      trailing: TextWithStyle(
                        text: "08/04/2021",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

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
