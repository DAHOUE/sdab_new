import 'package:flutter/material.dart';
import 'package:sdab_new/Screen/CardDynamique/card_dynamic.dart';
import 'package:sdab_new/Screen/mesFiches/mesFiches_screen.dart';


import '../../constants.dart';
import 'components/body.dart';
import 'components/homepopup.dart';

import 'package:sdab_new/constants.dart' as constants;




class HomeScreens extends StatefulWidget {
  int bottomSelectedIndex=0;

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {

  bool isPoPup=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPoPup=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
      myAppBar(widget.bottomSelectedIndex),
      body: Stack(children: [
        widget.bottomSelectedIndex==0?Body():widget.bottomSelectedIndex==2?Carte():widget.bottomSelectedIndex==1?MesFichesScreen():Container(),

        Positioned(child:isPoPup?HomePopUp(function: changeIsPoPup,): Container())
      ],),
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor: color_yellow,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('ACCUEIL'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            title: Text('FICHES'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('CARTE'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title: Text('COMPTE'),
          ),
        ],
        currentIndex: widget.bottomSelectedIndex,
        onTap: (index){
          setState(() {
            widget.bottomSelectedIndex=index;
          });
        },
      ),
      floatingActionButton: Container(
        width:MediaQuery.of(context).size.width/5,
        height: MediaQuery.of(context).size.width/5,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:color_white,

        ),
        child: Column(children: [
          Spacer(),
          FloatingActionButton(
            backgroundColor: color_yellow,
            child: Icon(Icons.add),
            onPressed: () {
              changeIsPoPup();
            },
          ),
          Spacer()
        ],),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  void changeIsPoPup(){
    setState(() {
      isPoPup=!isPoPup;
    });
  }

  AppBar myAppBar(int page){
    switch (page){
      case 0:
      case 3:
        return AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey,),
          title: Text("e-pineA",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: color_green
          ),),
          backgroundColor: color_white,
          actions: [
            IconButton(icon: Icon(Icons.search,color: color_green,), onPressed: (){

            })
          ],
        );
        break;
      case 1:
        return  AppBar(title: Text("Mes fiches techniques"),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: color_green,
          elevation: 0.0,
        );
        break;
      case 2:
        return AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Diponibilité d'ananas"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(),
                ],
              )
            ],
          ),
          backgroundColor: color_green,


        );
        break;
      default:
        return AppBar();
        break;
    }
  }

  BottomNavigationBar myNavigation()
  {
    BottomNavigationBar producteur = BottomNavigationBar(
      selectedItemColor: color_yellow,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('ACCUEIL'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note_outlined),
          title: Text('FICHES'),
        ),

        // BottomNavigationBarItem(
        //   icon: Icon(Icons.map),
        //   title: Text('CARTE'),
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.perm_identity),
        //   title: Text('COMPTE'),
        // ),
      ],
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index){
        setState(() {
          widget.bottomSelectedIndex=index;
        });
      },
    );
    BottomNavigationBar exportateur = BottomNavigationBar(
      selectedItemColor: color_yellow,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('ACCUEIL'),
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('CARTE'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('COMPTE'),
        ),
      ],
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index){
        setState(() {
          widget.bottomSelectedIndex=index;
        });
      },
    );
    BottomNavigationBar fournisseur = BottomNavigationBar(
      selectedItemColor: color_yellow,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('ACCUEIL'),
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('COMPTE'),
        ),
      ],
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index){
        setState(() {
          widget.bottomSelectedIndex=index;
        });
      },
    );
    BottomNavigationBar tout = BottomNavigationBar(
      selectedItemColor: color_yellow,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('ACCUEIL'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note_outlined),
          title: Text('FICHES'),
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('CARTE'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('COMPTE'),
        ),
      ],
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index){
        setState(() {
          widget.bottomSelectedIndex=index;
        });
      },
    );

    print(constants.type);
    print("const");
    if(constants.type=='Producteur')
      return producteur;
    else if(constants.type=='Fournisseur')
      return fournisseur;
    else if(constants.type=='Commerçant')
      return exportateur;
    else
      return tout;

  }
}

