import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdab_new/constants.dart' as constants;
import 'package:sdab_new/helper/apiRequestFunctions.dart';
import 'package:sdab_new/helper/lacalisation.dart';
import 'package:sdab_new/helper/loading.dart';

class Body extends StatefulWidget{
  Body({Key key, this.title, this.fiche}): super(key: key);

  final String title;
  final fiche;

  @override
  _Body createState () => _Body();
}

class _Body extends State<Body> {
  bool isLoading = false;
  DateTime dateTimechoisie;
  int _nombre_de_jours;


  String typeChamp;
  Key key = new Key("value");
  String dropdownvalue="";
  int _valu = 1;
  Size size;

  //
  String villeChamp="",quatierChamp="",cultivar="",natureProduction="",modePlantation="",etreillage="";
  final TextEditingController areaChampsControler = TextEditingController();
  final TextEditingController datePlantationControler = TextEditingController();
  final TextEditingController dateTifControler = TextEditingController();
  final TextEditingController densityControler = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final _formKey = new GlobalKey <FormState>();
  var position;
  bool isUpdate=false;




  @override
  void initState() {
    if(widget.fiche!=null){
      isUpdate = true;
      villeChamp = widget.fiche['ville'];
      quatierChamp = widget.fiche['quartier'];
      cultivar = widget.fiche['cultiva'];
      etreillage = widget.fiche['ethrellage'];
      modePlantation = widget.fiche['mode_plantation'];
      areaChampsControler.text = widget.fiche['superficie'].toString();
      datePlantationControler.text = widget.fiche['date_creation'];
      densityControler.text = widget.fiche['densite'];
      dateTifControler.text = widget.fiche['date_tif'];
      positionController.text= widget.fiche['longitude'].toString()+','+widget.fiche['latitude'].toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
            physics: new AlwaysScrollableScrollPhysics(),
            child: Padding(padding: EdgeInsets.all(30),
              child: Form(
                key:  _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: villeChamp,
                      isDense: true,
                      items: [
                        DropdownMenuItem(child: Text("La ville de votre champs"), value: "",),
                        DropdownMenuItem(child: Text("Allada"), value: "Allada".toUpperCase(),),
                        DropdownMenuItem(child: Text("Kpahou"), value: "Kpahou".toUpperCase(),),
                        DropdownMenuItem(child: Text("Bohicon"), value: "Bohicon".toUpperCase(),),
                      ],
                      validator: (value){
                        if(value.isEmpty)
                          return ("Pas valide");
                        else
                          return null;
                      },
                      onChanged: (value){
                        setState(() {
                          villeChamp = value;
                        });
                        //print(villeChamp);
                      },
                      decoration: InputDecoration(
                          labelText: "Ville du champ",
                          labelStyle: TextStyle(color: Colors.black54)
                      ),

                    ),
                    DropdownButtonFormField(
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: quatierChamp,
                      isDense: true,
                      items: [
                        DropdownMenuItem(child: Text("La Quatier de votre champs"), value: "",),
                        DropdownMenuItem(child: Text("Allada"), value: "Allada".toUpperCase(),),
                        DropdownMenuItem(child: Text("Kpahou"), value: "Kpahou".toUpperCase(),),
                        DropdownMenuItem(child: Text("Bohicon"), value: "Bohicon".toUpperCase(),),
                      ],
                      validator: (value){
                        if(value.isEmpty)
                          return ("Pas valide");
                        else
                          return null;
                      },
                      onChanged: (value){
                        setState(() {
                          quatierChamp = value;
                        });
                        //print(quatierChamp);
                      },
                      decoration: InputDecoration(
                          labelText: "Quatier du champ",
                          labelStyle: TextStyle(color: Colors.black54)
                      ),

                    ),
                    TextFormField(
                      controller: areaChampsControler,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Superficie du champs en m2",
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: "250 000 ",
                      ),
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                    ),
                    TextFormField(
                      controller: positionController,
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      showCursor: false,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Position",
                        hintText: "Selectionner votre position",
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        suffixIcon: Container(
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.all(6.0),
                            child: TextButton(
                              onPressed: () async {
                                //position =  await determinePosition();
                                setState(() {
                                  positionController.text = '0.4582333,0.4582333';
                                });

                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(8.0,15.0)),
                                backgroundColor: MaterialStateProperty.all(constants.color_green),
                              ),
                              child: Icon(Icons.add_location_outlined, color: Colors.white,),
                            )
                        ),
                      ),),
                    DropdownButtonFormField(
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: cultivar,
                      isDense: true,
                      items: [
                        DropdownMenuItem(child: Text("Cultivar"), value: "".toUpperCase(),),
                        DropdownMenuItem(child: Text("Allada"), value: "Allada".toUpperCase(),),
                        DropdownMenuItem(child: Text("Kpahou"), value: "Kpahou".toUpperCase(),),
                        DropdownMenuItem(child: Text("Bohicon"), value: "Bohicon".toUpperCase(),),
                      ],
                      onChanged: (value){
                        setState(() {
                          cultivar = value;
                        });
                        //print(cultivar);
                      },
                      decoration: InputDecoration(
                          labelText: "Cultivar",
                          hintText: "Nom du cultivar",
                          labelStyle: TextStyle(color: Colors.black54)
                      ),

                    ),
                    DropdownButtonFormField(
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),

                      value: natureProduction,
                      isDense: true,
                      items: [

                        DropdownMenuItem(child: Text("Nature de la production"), value: "".toUpperCase(),),
                        DropdownMenuItem(child: Text("Nature 1"), value: "Nature 1".toUpperCase(),),
                        DropdownMenuItem(child: Text("Nature 2"), value: "Nature 2".toUpperCase(),),
                      ],
                      onChanged: (value){
                        setState(() {
                          natureProduction = value;
                        });
                        //print(natureProduction);
                      },
                      decoration: InputDecoration(
                          labelText: "Nature de la production ",
                          hintText: "Nature",
                          labelStyle: TextStyle(color: Colors.black54)
                      ),

                    ),
                    DropdownButtonFormField(
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),

                      value: modePlantation,
                      isDense: true,
                      items: [

                        DropdownMenuItem(child: Text("Mode de la plantation"), value: "".toUpperCase(),),
                        DropdownMenuItem(child: Text("Mode 1"), value: "Mode 1".toUpperCase(),),
                        DropdownMenuItem(child: Text("Mode 2"), value: "Mode 2".toUpperCase(),),
                        DropdownMenuItem(child: Text("Mode 3"), value: "Mode 3".toUpperCase(),),
                      ],
                      onChanged: (value){
                        setState(() {
                          modePlantation = value;
                        });
                        //print(modePlantation);
                      },
                      decoration: InputDecoration(
                          labelText: "Mode de la plantation",
                          hintText: "Mode",
                          labelStyle: TextStyle(color: Colors.black54)
                      ),

                    ),
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      controller: datePlantationControler,
                      showCursor: false,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Date de la plantation",
                          hintText: "dd-mm-yyyy",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.all(6.0),
                            child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                                onPressed: (){
                                  montrerDate(datePlantationControler);
                                }),
                          )
                      ),
                    ),
                    TextFormField(
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      controller: dateTifControler,
                      showCursor: false,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Date du TIF",
                          hintText: "dd-mm-yyyy",
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.all(6.0),
                            child: IconButton(icon: Icon(Icons.calendar_today_sharp),
                                onPressed: (){
                                  montrerDate(dateTifControler);
                                }),
                          )
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: densityControler,
                      decoration: InputDecoration(
                        labelText: "Densité",
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: "Densité",

                      ),
                    ),
                    DropdownButtonFormField(
                      validator: (value){
                        if(value.isEmpty)
                          return 'Pas valid';
                        else
                          return null;
                      },
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: etreillage,
                      isDense: true,
                      items: [
                        DropdownMenuItem(child: Text("Avez vous fait d'etreillage?"), value: "".toUpperCase(),),
                        DropdownMenuItem(child: Text("Oui"), value: "Oui".toUpperCase(),),
                        DropdownMenuItem(child: Text("Non"), value: "Non".toUpperCase(),),
                      ],
                      onChanged: (value){
                        setState(() {
                          etreillage = value;
                        });
                        //print(etreillage);
                      },
                      decoration: InputDecoration(
                          labelText: "Etreillage",
                          hintText: "Node",
                          labelStyle: TextStyle(color: Colors.black54)
                      ),

                    ),
                    GestureDetector(
                      child: TextButton(
                        onPressed: () async {

                          if(_formKey.currentState.validate()){
                            setState(() {
                              isLoading = true;
                            });
                            var result;
                             if(isUpdate){
                               result = await updateFiches(urlApi:constants.urlApi+'/api/fiche_technique',
                                   headers:{
                                     'Accept': 'application/json',
                                     'Authorization': 'Bearer ${constants.token}',
                                   },
                                   data: {
                                     "ville": villeChamp,
                                     "quartier": quatierChamp,
                                     "superficie": areaChampsControler.text,
                                     "longitude": "0.1542964",
                                     "latitude": "0.4582333",
                                     "cultiva": cultivar,
                                     "user_id": "1",
                                     "date_creation": datePlantationControler.text,
                                     "ethrellage": etreillage,
                                     "mode_plantation": modePlantation,
                                     "densite": densityControler.text,
                                     "date_tif": dateTifControler.text,
                                     "marqueur": "bleu",
                                     "quantite_a_produire": "0"
                                   }
                               );
                             }else{
                               result = await saveFiches(urlApi:constants.urlApi+'/api/fiche_technique',
                                   headers:{
                                     'Accept': 'application/json',
                                     'Authorization': 'Bearer ${constants.token}',
                                   },
                                   data: {
                                     "ville": villeChamp,
                                     "quartier": quatierChamp,
                                     "superficie": areaChampsControler.text,
                                     "longitude": "0.1542964",
                                     "latitude": "0.4582333",
                                     "cultiva": cultivar,
                                     "user_id": "1",
                                     "date_creation": datePlantationControler.text,
                                     "ethrellage": etreillage,
                                     "mode_plantation": modePlantation,
                                     "densite": densityControler.text,
                                     "date_tif": dateTifControler.text,
                                     "marqueur": "bleu",
                                     "quantite_a_produire": "0"
                                   }
                               );
                             }
                            print(result);
                            if(result[0]["success"]){
                              setState(() {
                                isLoading = false;
                              });

                            }
                            else{
                              setState(() {
                                isLoading = false;
                              });
                            }
                            print(result[0]["success"]);
                          }

                        },
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text(
                                isUpdate?"Update":"Enrégistrer",
                                style: TextStyle(color: Colors.white),
                              ),
                            )],
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(constants.color_green),
                          elevation: MaterialStateProperty.all(15.0),

                        ),
                      ),
                    )
                  ],
                ),
              ),)

        ),
        Positioned(child: isLoading?Loading(0):Container())
      ],
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
        controller.text = choix.day.toString()+"-"+choix.month.toString()+"-"+choix.year.toString();
      });
    }
  }

}
