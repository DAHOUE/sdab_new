import 'package:flutter/material.dart';



class Loading extends StatefulWidget {
  final int cas;
  const Loading(this.cas);
  //cas = 0 all screen
  //cas = 1 pop up
  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: new Duration(seconds:10));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addStatusListener((status) {
      if(status==AnimationStatus.completed)
        animationController.reverse();
      else if(status == AnimationStatus.dismissed)
        animationController.forward();
    });
    animationController.forward();



  }

  @override
  Widget build(BuildContext context) {
    return widget.cas==0? Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: CircularProgressIndicator(
        ),
      ),
      color: Colors.white.withOpacity(0.5),
    )
        :widget.cas==1?Container(

      child: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              Image.asset("assets/images/logoSmash.png",
                width: animation.value*125,
                height: animation.value*125,
              ),
              Text('Patientez SVP...'),
              Expanded(child: Container()),
            ],
          )
      ),
      color: Colors.white,
    )
        :Container();
  }

}


class Skeleton extends StatefulWidget {
  final double height;
  final double width;
  final int cas;

  Skeleton({Key key, this.height = 20, this.width = 200, @required this.cas }) : super(key: key);

  @override
  SkeletonState createState() => SkeletonState();
}

class SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
   AnimationController _controller;

   Animation gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.linear
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    if (widget.cas ==0) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(5, (index) => categoryLoading())
          ],
        ),
      );
    } else {
      if (widget.cas == 1) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(1, (index) => spacialProductLoading())
            ],
          ),
        );
      } else {
        return Container(
      width:  widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(gradientPosition.value, 0),
              end: Alignment(-1, 0),
              colors: [Colors.black12, Colors.black26, Colors.black12]
          )
      ),
    );
      }
    }
  }

  categoryLoading(){
    return Container(
      padding: EdgeInsets.all(10),
      width: 55,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(gradientPosition.value, 0),
                    end: Alignment(-1, 0),
                    colors: [Colors.black12, Colors.black26, Colors.black12]
                ),
                borderRadius: BorderRadius.circular(20)
            ),

          ),
          SizedBox(height: 5),
          Container(
            width:  55,
            height: 15,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(gradientPosition.value, 0),
                    end: Alignment(-1, 0),
                    colors: [Colors.black12, Colors.black26, Colors.black12]
                )
            ),
          )
        ],
      ),
    );
  }

  spacialProductLoading(){
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.width*0.9*0.6,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(gradientPosition.value, 0),
              end: Alignment(-1, 0),
              colors: [Colors.black12, Colors.black26, Colors.black12]
          ),
          borderRadius: BorderRadius.circular(20)
      ),

    );
  }
}