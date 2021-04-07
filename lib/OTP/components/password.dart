import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Password extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StatePassword();
  }

}

class StatePassword extends State<Password>{
  TextEditingController newPassController = new TextEditingController();
  TextEditingController ConfirmPassController = new TextEditingController();
  bool obscureText =true;
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
                  IconButton(icon: Icon(Icons.clear), onPressed: (){
                  })
                ],
              ),

              Padding(padding: EdgeInsets.all(30),
                child: Text("Entrez votre nouveau Mot de passe",style: TextStyle(fontSize: 18,),
                  textAlign: TextAlign.center,

                ),),
              Padding(padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                onPressed: (){
                                  setState(() {
                                    obscureText=!obscureText;
                                  });
                                },
                                icon: Icon(!obscureText?Icons.remove_red_eye:Icons.remove_red_eye_outlined),
                              ),
                              labelText: 'Nouveau mot de passe',
                              labelStyle: TextStyle(color: Colors.black)
                          ),
                          validator: (val) {
                            return val.length>=8
                                ? null
                                :"Please Enter Strong password";
                          },
                          controller: newPassController,
                        ),
                        TextFormField(
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              labelText: 'Confirmer mot de passe',
                              labelStyle: TextStyle(color: Colors.black)
                          ),
                          validator: (val) {
                            return val==newPassController.text
                                ? null
                                :"Not equal";
                          },
                          controller: ConfirmPassController,
                        ),
                      ],
                    )),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: TextButton(
                  onPressed: (){
                    if(_formKey.currentState.validate())
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data for ${newPassController.value.text.toString().trim()}')));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(padding: EdgeInsets.all(10),
                          child: Text(
                            "Confirmer",
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