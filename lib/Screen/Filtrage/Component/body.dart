import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/Login/login_screen.dart';

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
   // List<String> titre= ["Producteur", "Transformateur", "Commerçant"];
    Key key = new Key("value");
    String dropdownvalue="";
    int _valuVariete = 1;
    int _valueZone = 1;
    int _valuequantite = 1;
    int _valueEtat = 1;
    return SingleChildScrollView(
      physics: new AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            color: Colors.white,
            elevation: 8.0,
            margin: EdgeInsets.zero,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: TextWithStyle(
                  text: "Sélectionnez pour faire un filtrage",
                  colors: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),

            child:  Card(
              shadowColor: Colors.blueGrey,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))
              ),

              child: DropdownButtonFormField(
                elevation: 16,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valuVariete,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Center(child: Text("Variété d'ananas")), value: 1,),
                  DropdownMenuItem(child: Center(child: Text("Cayenne Lisse")), value: 2,),
                  DropdownMenuItem(child: Center(child: Text("Pains de Sucre")), value: 3,),
                ],
                onChanged: (value){
                  setState(() {
                    _valuVariete = value;


                  });
                  print(_valuVariete);
                },
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Variété d'ananas",
                    hasFloatingPlaceholder: false,
                    hintText: "Variété d'ananas",
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    )
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),

            child:  Card(
              shadowColor: Colors.blueGrey,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
              ),

              child: DropdownButtonFormField(
                elevation: 16,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valueZone,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Center(child: Text("Zone de production")), value: 1,),
                  DropdownMenuItem(child: Center(child: Text("Allada")), value: 2,),
                  DropdownMenuItem(child: Center(child: Text("Tori")), value: 3,),
                  DropdownMenuItem(child: Center(child: Text("Azovè")), value: 4,),
                  DropdownMenuItem(child: Center(child: Text("Zè")), value: 5,),
                  DropdownMenuItem(child: Center(child: Text("Toffo")), value: 6,),

                ],
                onChanged: (value){
                  setState(() {
                    _valueZone = value;


                  });
                  print(_valueZone);
                },
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Zone de production",
                    hasFloatingPlaceholder: false,
                    hintText: "Zone de production",
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    )
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),

            child:  Card(
              shadowColor: Colors.blueGrey,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
              ),

              child: DropdownButtonFormField(
                elevation: 16,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valuequantite,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Center(child: Text("Quantité")), value: 1,),
                  DropdownMenuItem(child: Center(child: Text("0 - 100 tonnes")), value: 2,),
                  DropdownMenuItem(child: Center(child: Text("100 - 300 tonnes")), value: 3,),
                  DropdownMenuItem(child: Center(child: Text("300 - 500 tonnes")), value: 4,),
                  DropdownMenuItem(child: Center(child: Text("500 - 1000 tonnes")), value: 5,),

                ],
                onChanged: (value){
                  setState(() {
                    _valuequantite = value;


                  });
                  print(_valuequantite);
                },
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Quantité",
                    hasFloatingPlaceholder: false,
                    hintText: "Quantité",
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    )
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),

            child:  Card(
              shadowColor: Colors.blueGrey,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
              ),

              child: DropdownButtonFormField(
                elevation: 16,
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valueEtat,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Center(child: Text("Etat de maturité")), value: 1,),
                  DropdownMenuItem(child: Center(child: Text("0 - 3 mois")), value: 2,),
                  DropdownMenuItem(child: Center(child: Text("3 - 6 mois")), value: 3,),
                  DropdownMenuItem(child: Center(child: Text("6 - 9 mois")), value: 4,),
                  DropdownMenuItem(child: Center(child: Text("9 - 12 mois")), value: 5,),

                ],
                onChanged: (value){
                  setState(() {
                    _valueEtat = value;
                  });
                  print(_valueEtat);
                },
                decoration: InputDecoration(
                    hintTextDirection: TextDirection.ltr,
                    labelText: "Etat de maturité",
                    hasFloatingPlaceholder: false,
                    hintText: "Etat de maturité",
                    labelStyle: TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    )
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 0.0),
            child: GestureDetector(
              child: TextButton(
                onPressed: (){},
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [


                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: Text(
                        "Filtrer",
                        style: TextStyle(color: Colors.white),
                      ),
                    )],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(constants.color_green),
                  elevation: MaterialStateProperty.all(15.0),

                ),
              ),
            ),
          ),





        ],
      ),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    Body();
  }






}
