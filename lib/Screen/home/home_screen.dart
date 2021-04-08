import 'package:flutter/material.dart';


import '../../constants.dart';
import 'components/body.dart';
import 'components/homepopup.dart';


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

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueGrey),
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
      ),
      body: Stack(children: [
        widget.bottomSelectedIndex==0?Body():Container(),
        Positioned(child:isPoPup?HomePopUp(function: changeIsPoPup,): Container())
      ],),
      bottomNavigationBar: BottomNavigationBar(
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
}

