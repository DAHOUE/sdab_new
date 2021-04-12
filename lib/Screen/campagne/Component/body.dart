import 'package:flutter/cupertino.dart';
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
  final cycleProduction = TextEditingController();
  final debutPlantation = TextEditingController();
  final finPlantation = TextEditingController();
  String typeChamp;
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
                  text: "Enrégistrement de campagne",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
              child:  TextFormField(
                controller: cycleProduction,
                showCursor: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Cycle de production",
                    hintText: "2021-2022",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(6.0),
                      child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                      onPressed: (){
                        typeChamp = "cycle";
                        montrerDate(cycleProduction);
                      }),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child:  TextFormField(
                controller: debutPlantation,
                showCursor: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Date de début",
                    hintText: "22-10-20",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    suffixIcon: Container(
                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(6.0),
                      child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                          onPressed: (){
                        typeChamp="debut";
                        montrerDate(debutPlantation);
                          }),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child:  TextFormField(
                controller: finPlantation,
                showCursor: false,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: "Date de fin",
                    hintText: "22-10-20",
                    labelStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    suffixIcon: Container(

                      padding: EdgeInsets.all(2.0),
                      margin: EdgeInsets.all(6.0),
                      child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                          onPressed: (){
                        typeChamp="fin";
                        montrerDate(finPlantation);
                          }),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
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

      _nombre_de_jours= jours;
      dateTimechoisie = choix;
      DateTime debut = choix;
      DateTime fin = choix.add(Duration(days: 550));


      setState(() {

       choix.add(Duration(days:550));
        int a= choix.year.toInt();
       if(typeChamp.compareTo("cycle").isEven)
       {
         controller.text = debut.year.toString()+ " - "+ fin.year.toString();
       }
       else
         controller.text = debut.day.toString()+" - "+debut.month.toString()+" - "+debut.year.toString();


      });
    }



  }


}
