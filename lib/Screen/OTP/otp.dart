import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/codeRestauration.dart';
import 'components/number.dart';
import 'components/password.dart';

class Otp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateOtp();
  }

}


class StateOtp extends State<Otp>{
  String number;
  bool passSreen;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = null;
    passSreen = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: color_green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15),
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                child: Image.asset("assets/images/logo_blanc.jpeg"),
              ),
            ),

            passSreen?Password():number==null?Number(function: saveNumber,action: otp,):CodeRestauration(number: number,function: sreenPass,)

          ],
        ),
      )
    );
  }

  void saveNumber(num){
    setState(() {
      number=num;
    });
  }

  void sreenPass(){
    setState(() {
      passSreen=true;
    });
  }

}