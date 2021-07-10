import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdab_new/Components/text_with_style.dart';
import 'package:sdab_new/Screen/OTP/otp.dart';
import 'package:sdab_new/Screen/Register/register_screen.dart';
import 'package:sdab_new/Screen/ficheTechnique/fiche_screen.dart';
import 'package:sdab_new/Screen/home/home_screen.dart';
import 'package:sdab_new/constants.dart' as constants;
import 'package:sdab_new/helper/apiRequestFunctions.dart';
import 'package:sdab_new/helper/loading.dart';

class Body extends StatefulWidget{
  Body({Key key, this.title}): super(key: key);

  final String title;

  @override
  _Body createState () => _Body();
}

class _Body extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> titre= ["Producteur", "Transformateur", "Commerçant"];
    Key key = new Key("value");
    String dropdownvalue="";
    int _valu = 1;
    return SingleChildScrollView(
      physics: new AlwaysScrollableScrollPhysics(),
      child: FutureBuilder(
        future: getFiches(urlApi: constants.urlApi+'/api/fiche_technique',headers:{
        'Accept': 'application/json',
        'Authorization': 'Bearer ${constants.token}',
        }),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? buildList(context,snapshot.data)
              : Loading(0);
        }
    ));
  }

  buildList(context,List data){
    if(data[0]['success'])
      return Column(
        children: [
          ...List.generate(data[0]['data'].length, (index) {
            return GestureDetector(
              onTap:(){

              },
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                child: ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent,),
                  title: Text(
                    data[0]['data'][index]["quartier"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  trailing: PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Supprimer"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Mettre à jour"),
                      ),
                    ],
                    onSelected: (val)async{
                      if(val == 1){
                        final res = await deleteFiches(urlApi:constants.urlApi+'/api/fiche_technique',
                            headers:{
                              'Accept': 'application/json',
                              'Authorization': 'Bearer ${constants.token}',
                            },
                            id: data[0]['data'][index]["id"]);
                        print(res);
                      }
                      if(val == 2){
                        Navigator.push(context, MaterialPageRoute(builder: (builder){
                          return FicheScreen(fiche: data[0]['data'][index],);
                        }));
                      }
                    },
                  ),
                  subtitle: Text(
                    data[0]['data'][index]["mode_plantation"].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),

                ),
              ),
            );
          })
        ],
      );
    else
      return Container();
  }

  void versPageRegister() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return RegisterScreen();
    }));
  }

  void versPageHome() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return HomeScreens();
    }));
  }

  void versMdpOublie() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return Otp();
    }));
  }

}
