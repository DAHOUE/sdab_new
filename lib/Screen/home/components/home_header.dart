import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

TextEditingController _editingController;


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _editingController = TextEditingController();
    return Stack(children: [

      Column(children: [
        Container(
          color: color_green,
          child: Column(children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 20,left: 20),
                  child: Text(actuality,style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: color_white),),)
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20),
                  child: Container(
                      color: color_white,
                      width: 35.0,
                      height: 2.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0)
                  ),)
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(top: 20,left: 20,bottom: 50),
                  child: Text(another_actuality,style: TextStyle(fontSize: 18,color: color_white),),
                )
              ],
            ),

          ],
          ),
        ),
        Container(height: 50,color: color_white,)
      ],),
      Positioned(
        bottom: 17,
        left: 0,
        right: 0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 5,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.only(left: 10),
            height: 60,
            decoration: BoxDecoration(
                color: color_white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [BoxShadow(
                  offset: Offset(-5, 0),
                  blurRadius: 50,
                  color: color_green.withOpacity(0.23),
                )]
            ),
            child: Row(

              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: _editingController,
                      textAlignVertical: TextAlignVertical.center,
                      // onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        hintText: 'Rechercher un article',
                        hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),),

                ),
                _editingController.text.trim().isEmpty ? Container(
                  height: 60,
                  width: 70,
                  color: color_green,
                  child: IconButton(
                      icon: Icon(Icons.search, color: color_white),
                      onPressed: null),
                ) :
                IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.clear, color: Colors.blueGrey.withOpacity(0.5)),
                    onPressed: (){

                    }
                ),
              ],

            ),
          ),
        )
      ),
    ],);

  }
}

