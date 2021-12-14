import 'dart:ui';
// import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class ConfirmedDelivery extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => ConfirmedDeliveryState();
    }

    class ConfirmedDeliveryState extends State<ConfirmedDelivery>
        with SingleTickerProviderStateMixin {
    late  final AnimationController controller;
     late final Animation<double> scaleAnimation;

      @override
      void initState() {
        super.initState();
    //     Timer(Duration(seconds: 2),
		// ()=>showDialog(context: context, builder: (_) => CustomerConfirmation()));
		
      
        controller =
            AnimationController(vsync: this, duration: Duration(milliseconds: 450));
        scaleAnimation =
            CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

        controller.addListener(() {
          setState(() {});
        });

        controller.forward();
      }

      @override
      Widget build(BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                  padding: EdgeInsets.only(left:15,top:0),
                  height: 400.0,
                  width: 280.0,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 90, 10, 0),
                        child: Image.asset('assets/images/checked (2).png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,right:5),
                        child: Text('Success!',style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10,right: 40,left: 40),
                        child: Text('Delivery has been confirmed successfully.',textAlign: TextAlign.center,
                        style: TextStyle(fontSize:17),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30),
                        child: Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 2,
    ),
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(30))
  ),
  child: Padding(
    padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
    child: TextButton(onPressed: (){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    },child: Text('Okay!', 
    style: TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold),),),
  )
),
                      )
                      
                    ],
                  )),
            ),
          ),
        );
      }
    }