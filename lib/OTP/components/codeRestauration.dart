import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CodeRestauration extends StatefulWidget{
  final String number;
  final Function function;

  const CodeRestauration({Key key, @required this.number, this.function}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateCodeRestauration();
  }

}

class StateCodeRestauration extends State<CodeRestauration>{
  TextEditingController codeController = new TextEditingController();
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
                child: 
                RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(

                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,

                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Entrez le code envoyé au '),
                    new TextSpan(text: '${widget.number}', style: new TextStyle(fontWeight: FontWeight.bold,color: color_green)),
                  ],
                ),),),
              Padding(padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Code de restauration',
                              labelStyle: TextStyle(fontSize: 20,color: Colors.black)
                          ),
                          validator: (val) {
                            return val=='00000'
                                ? null
                                :"Code incorrecte";
                          },
                          controller: codeController,
                        ),
                      ],
                    )),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: TextButton(
                  onPressed: (){
                    if(_formKey.currentState.validate())
                      widget.function();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data for ${codeController.value.text.toString().trim()}')));
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