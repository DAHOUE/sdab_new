

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdab_new/Components/text_with_style.dart';
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextWithStyle(
                  text: "Enrégistrement de champ",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0,30.0, 0.0),

              child:  DropdownButtonFormField(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valu,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Text("Allada"), value: 1,),
                  DropdownMenuItem(child: Text("Kpahou"), value: 2,),
                  DropdownMenuItem(child: Text("Bohicon"), value: 3,),
                ],
                onChanged: (value){
                  setState(() {
                    _valu = value;


                  });
                  print(_valu);
                },
                decoration: InputDecoration(
                    labelText: "Ville du champ",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0,30.0, 0.0),
              child:  DropdownButtonFormField(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valu,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Text("Allada"), value: 1,),
                  DropdownMenuItem(child: Text("Kpahou"), value: 2,),
                  DropdownMenuItem(child: Text("Bohicon"), value: 3,),
                ],
                onChanged: (value){
                  setState(() {
                    _valu = value;


                  });
                  print(_valu);
                },
                decoration: InputDecoration(
                    labelText: "Quartier du champ",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0,30.0, 0.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Superficie du champs en m2",
                  labelStyle: TextStyle(color: Colors.black54),
                  hintText: "250 000",

                ),
              ),

            ),
            Padding(padding: const EdgeInsets.fromLTRB(30.0, 30.0,30.0, 0.0),
              child: TextFormField(
                showCursor: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  labelText: "Position",
                  hintText: "Selectionner votre position",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  suffixIcon: Container(
                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(6.0),
                      child: TextButton(style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(8.0,15.0)),
                        backgroundColor: MaterialStateProperty.all(constants.color_green),
                      ),
                        child: Icon(Icons.add_location_outlined, color: Colors.white,),
                      )
                  ),
                ),),),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0,30.0, 0.0),
              child: GestureDetector(
                child: TextButton(
                  onPressed: (){},
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        child: Text(
                          "Valider",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
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


}
