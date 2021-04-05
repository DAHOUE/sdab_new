import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class Actuality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> actu = [
      {"title":"Fertilisants", "text": "A Glo les fertilisants sont risqués","img": "assets/images/clover.jpg"},
      {"title":"Ananas", "text": "Le prix augmente","img": "assets/images/ananas.jpg"},
      {"title":"Ananas", "text": "Au Bénin","img": "assets/images/mastercard-2.png"},

    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(children: [
            Text(actuality,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            Spacer(),

          ],),),
        Padding(
          padding: EdgeInsets.only(bottom: 10, ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                actu.length,
                    (index) => ActualityCard(
                      title: actu[index]["title"],
                  text: actu[index]["text"],
                  img: actu[index]["img"],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ActualityCard extends StatelessWidget {
  const ActualityCard({
    Key key,

    @required this.text,
    @required this.title,
    @required this.img,
  }) : super(key: key);

  final String title, text,img;


  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.only(
              top: 5,bottom: 5,left: 10,right: 10
          ),
          child:Card(
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4,
            child:GestureDetector(
              onTap: (){

              },
              child:  Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height*0.3,

                      child: CachedNetworkImage(
                        imageUrl:img,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(img),
                        width:MediaQuery.of(context).size.width ,
                      )
                  ),
                  Positioned(
                    bottom:10,
                    left: 0,
                    right: 0,
                    child:Container(
                        height: MediaQuery.of(context).size.height*0.115,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            )
                        ),
                        child:Column(
                          children: [
                            Spacer(),
                            Padding(
                                child:Row(
                                  children: [
                                    Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  ],
                                ),
                                padding: EdgeInsets.only(left: 20)),

                            Padding(
                                child:Row(
                                  children: [
                                    Text(text,style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                padding: EdgeInsets.only(left: 20)),
                            Spacer()

                          ],
                        )
                    ),
                  )

                ],
              ),
            ),

          )
      );

  }
}
