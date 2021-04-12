import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/OTP/components/number.dart';

import '../../constants.dart';
import 'Components/finalisation.dart';
import 'Components/moyen_paiement.dart';

class Paiement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StatePaiement();
  }

}


class StatePaiement extends State<Paiement>{
  String number;
  int page=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = null;
    page=0;
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
              page==0?MoyenPaiement(function: nextPage):page==1?Number(function: saveNumber, action: paie):Finalisation(),

            ],
          ),
        )
    );
  }

  void saveNumber(num){
    setState(() {
      number=num;
    });
    nextPage();
  }

  void nextPage(){
    setState(() {
      page++;
    });
  }

}