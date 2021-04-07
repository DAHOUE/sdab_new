import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class MoyenPaiement extends StatefulWidget{
  final Function function;

  const MoyenPaiement({Key key,@required this.function}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateMoyenPaiement();
  }

}

class StateMoyenPaiement extends State<MoyenPaiement>{
  int groupValue=-1;

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
                child: Text("Choisissez votre moyen de paiement",style: TextStyle(fontSize: 18,),
                  textAlign: TextAlign.center,

                ),),
              Padding(padding: EdgeInsets.all(20),
                child: Container(
                  child: Column(
                    children: [
                      RadioListTile(
                          activeColor: color_green,
                        title: Row(children: [
                          Text('Moov Africa')
                        ],),
                          value: 0, groupValue: groupValue, onChanged: (val){
                        setState(() {
                          groupValue=val;
                        });
                      }),

                      RadioListTile(
                          title: Row(children: [
                            Text('MTN')
                          ],),
                          value: 1, groupValue: groupValue, onChanged: (val){
                            setState(() {
                              groupValue=val;
                            }
                            );
                      },
                      activeColor: color_green,),
                    ],
                  ),
                ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: TextButton(
                  onPressed: (){
                    widget.function();
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(padding: EdgeInsets.all(10),
                          child: Text(
                            "Suivant",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),))
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color_green),
                    elevation: MaterialStateProperty.all(15.0),

                  ),
                ),
              ),

            ],),
          ),
        ),
      ),);
  }

}