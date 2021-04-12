import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/home/components/recommandation.dart';

import 'actuality.dart';
import 'categories.dart';
import 'home_header.dart';


class Body extends StatefulWidget {

  @override
  @override
  _BobyState createState() => _BobyState();

}

class _BobyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: 30),
            Categories(),
            Actuality(),
            Recommandation(),
            // SpecialOffers(),
            // SizedBox(height: mes),
            // PopularProducts(),
            // SizedBox(height: mes),
          ],
        ),
      ),
    );
  }
}