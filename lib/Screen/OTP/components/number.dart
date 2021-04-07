import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class Number extends StatefulWidget{
  final Function function;
  final String action;

  const Number({Key key, @required this.function, @required this.action}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateNumber();
  }

}

class StateNumber extends State<Number>{
  TextEditingController numberController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                child: Text("Entrez votre numéro de téléphone",style: TextStyle(fontSize: 18,),
                  textAlign: TextAlign.center,

                ),),
              Padding(padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: '+229xxxxxxxx',
                              labelText: 'Numéro de téléphone',
                              labelStyle: TextStyle(fontSize: 16,color: Colors.black)
                          ),
                          validator: (val) {
                            return RegExp(
                                r"^\+229[0-9]+")
                                .hasMatch(val.trim()) && val.trim().length==12
                                ? null
                                :"Please Enter Correct Number";
                          },
                          controller: numberController,
                        ),
                      ],
                    )),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: TextButton(
                  onPressed: (){
                    if(_formKey.currentState.validate())
                    {
                      widget.function(numberController.text.toString().trim());

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data for ${numberController.text.toString().trim()}')));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(padding: EdgeInsets.all(10),
                          child: Text(
                            "Envoyer",
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