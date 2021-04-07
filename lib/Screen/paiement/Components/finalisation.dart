import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Finalisation extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateFinalisation();
  }

}

class StateFinalisation extends State<Finalisation>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),

        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            child: Column(children: [
              Row(
                children: [
                  Spacer(),
                  IconButton(icon: Icon(Icons.clear),
                      iconSize: 40,
                      onPressed: (){

                      })
                ],
              ),
              Padding(padding: EdgeInsets.all(30),
                child: Text("Veuillez patienter",style: TextStyle(fontSize: 20,),
                  textAlign: TextAlign.center,

                ),),
              Padding(padding: EdgeInsets.symmetric(vertical: 30),
              child: Container(
                child: CircularProgressIndicator(),
              ),),
            ],),
          ),
        ),
      ),);
  }

}