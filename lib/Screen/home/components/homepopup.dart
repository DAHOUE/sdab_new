import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomePopUp extends StatefulWidget{
  final Function function;

  const HomePopUp({Key key, this.function}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateHomePopUp();
  }

}


class StateHomePopUp extends State<HomePopUp>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: color_green.withOpacity(0.8),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Spacer(),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child:Container(
                  child: Column(children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(icon: Icon(Icons.clear), onPressed: (){
                          widget.function();
                        })
                      ],
                    ),
                    popupButton(0, 'Cycle de production', "icon"),
                    popupButton(1, 'Champs', 'icon'),
                    popupButton(2, 'Fiche technique', 'icon'),
                    SizedBox(height: 50,)


                  ],),
                ),
              ),
            ),
            Spacer()
          ],),
        )
    );
  }

  Widget popupButton(int code,String text,String icon){
    return Padding(padding: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: (){
          switch(code){
            case 0:
              widget.function();
              break;
            case 1:
              widget.function();
              break;
            case 2:
              widget.function();
              break;
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(30.0) //         <--- border radius here
            ),
          ),
          elevation: 2,
          child: Container (
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.0
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(30.0) //         <--- border radius here
              ),
            ), // <--- BoxDecoration here
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text (
                    "icons",
                    style: TextStyle (fontSize: 18.0),
                  ),),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text (
                    text,
                    style: TextStyle (fontSize: 16.0),
                  ),),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(Icons.add_circle_outline_outlined)),
              ],
            ),
          ),
        ),
      ),
    );
  }


}