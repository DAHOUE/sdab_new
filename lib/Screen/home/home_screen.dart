import 'package:flutter/material.dart';


import 'components/body.dart';


class HomeScreens extends StatefulWidget {
  int bottomSelectedIndex=0;
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("e-pineA",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
            color: Colors.green
        ),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.search,color: Colors.green,), onPressed: (){

          })
        ],
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
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
          color: Colors.white,

        ),
        child: Column(children: [
          Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          Spacer()
        ],),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

