import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';


class Recommandation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recommand = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal","img": "assets/images/agriculture.jpg"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill","img": "assets/images/mastercard-2.png"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game","img": "assets/images/ananas.jpg"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift","img": "assets/images/mastercard-2.png"},
      {"icon": "assets/icons/Discover.svg", "text": "More","img": "assets/images/ananas.jpg"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game","img": "assets/images/clover.jpg"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift","img": "assets/images/mastercard-2.png"},
      {"icon": "assets/icons/Discover.svg", "text": "More","img": "assets/images/clover.jpg"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game","img": "assets/images/agriculture.jpg"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift","img": "assets/images/ananas.jpg"},
      {"icon": "assets/icons/Discover.svg", "text": "More","img": "assets/images/agriculture.jpg"},
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(children: [
            Text(recommandation,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            Spacer(),

          ],),),

        Padding(
          padding: EdgeInsets.only(bottom: 10, ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                recommand.length,
                    (index) => RecommandationCard(
                  icon: recommand[index]["icon"],
                  text: recommand[index]["text"],
                  img: recommand[index]["img"],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class RecommandationCard extends StatelessWidget {
  const RecommandationCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.img,
  }) : super(key: key);

  final String icon, text,img;


  @override
  Widget build(BuildContext context) {
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: GestureDetector(
          onTap: (){

          },
          child: Padding(
            padding: EdgeInsets.only(
                left: 5,right: 5
            ),
            child: SizedBox(
                width: MediaQuery.of(context).size.width /2.50,
                child:Stack(

                  children: [
                    Column(

                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                )
                            ),
                            child: CachedNetworkImage(
                              imageUrl:img,
                              placeholder: (context, url) => LinearProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(img),

                            )
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height*0.115,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                )
                            ),
                            child:Column(
                              children: [
                                Spacer(),
                                Padding(
                                    child:Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    padding: EdgeInsets.only(top: 20)),

                                Padding(
                                    child: Text('Dans la culture',style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(bottom: 10)),
                                Spacer()

                              ],
                            )
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child:Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          Spacer(),
                          SvgPicture.asset(icon,height: 40,width: 40,),//icon
                          Spacer()
                        ],),
                      ),
                    )

                  ],
                )
            ),
          )
      ),);
  }
}
