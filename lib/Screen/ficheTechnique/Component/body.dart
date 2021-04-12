import 'dart:ffi';

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
  DateTime dateTimechoisie;
  int _nombre_de_jours;
  final datePlantation = TextEditingController();
  final datetif = TextEditingController();
  String typeChamp;

  Key key = new Key("value");
  String dropdownvalue="";
  int _valu = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


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
                  text: "Enregistrement de fiche technique",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),

              child:  DropdownButtonFormField(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valu,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Text("Champ 1"), value: 1,),
                  DropdownMenuItem(child: Text("Champ 2"), value: 2,),
                  DropdownMenuItem(child: Text("Champ 3"), value: 3,),
                ],
                onChanged: (value){
                  setState(() {
                    _valu = value;


                  });
                  print(_valu);
                },
                decoration: InputDecoration(
                    labelText: "Champs",
                    hintText: "Nom du champs",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Superficie du champs en m2",
                  labelStyle: TextStyle(color: Colors.black54),
                  hintText: "800",

                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

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
                    labelText: "Cultivar",
                    hintText: "Nom du cultivar",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

              child:  DropdownButtonFormField(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valu,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Text("Nature 1"), value: 1,),
                  DropdownMenuItem(child: Text("Nature 2"), value: 2,),
                ],
                onChanged: (value){
                  setState(() {
                    _valu = value;


                  });
                  print(_valu);
                },
                decoration: InputDecoration(
                    labelText: "Nature de la production ",
                    hintText: "Nature",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

              child:  DropdownButtonFormField(
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down),

                value: _valu,
                isDense: true,
                items: [

                  DropdownMenuItem(child: Text("Mode 1"), value: 1,),
                  DropdownMenuItem(child: Text("Mode 2"), value: 2,),
                  DropdownMenuItem(child: Text("Mode 3"), value: 3,),
                ],
                onChanged: (value){
                  setState(() {
                    _valu = value;


                  });
                  print(_valu);
                },
                decoration: InputDecoration(
                    labelText: "Mode de la plantation",
                    hintText: "Node",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child:  TextFormField(
                controller: datePlantation,
                showCursor: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Date de la plantation",
                    hintText: "22-10-20",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(6.0),
                      child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                          onPressed: (){
                            montrerDate(datePlantation);
                          }),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child:  TextFormField(
                controller: datetif,
                showCursor: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Date tif",
                    hintText: "22-10-20",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(6.0),
                      child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                          onPressed: (){
                            montrerDate(datetif);
                          }),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Densité",
                  labelStyle: TextStyle(color: Colors.black54),
                  hintText: "Densité",

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

                  DropdownMenuItem(child: Text("Oui"), value: 1,),
                  DropdownMenuItem(child: Text("Non"), value: 2,),
                ],
                onChanged: (value){
                  setState(() {
                    _valu = value;


                  });
                  print(_valu);
                },
                decoration: InputDecoration(
                    labelText: "Etreillage",
                    hintText: "Node",
                    labelStyle: TextStyle(color: Colors.black54)
                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
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
                          "Enrégistrer",
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
      ),

    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    Body();
  }

  Future<Null> montrerDate(controller) async{
    DateTime choix = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,

    );
    if(choix != null){
      var difference = new DateTime.now().difference(choix);
      var jours = difference.inDays;
      var ans = (jours / 365);

      setState(() {
        controller.text = choix.day.toString()+" - "+choix.month.toString()+" - "+choix.year.toString();
      });
    }
  }


}
