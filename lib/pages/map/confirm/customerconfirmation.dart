import 'dart:async';
import 'dart:ui';



import 'package:demoapp/pages/map/confirm/requestfailed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class CustomerConfirmation extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => CustomerConfirmationState();
    }

    class CustomerConfirmationState extends State<CustomerConfirmation>
        with SingleTickerProviderStateMixin {
    late  final AnimationController controller;
     late final Animation<double> scaleAnimation;

      @override
      void initState() {
        super.initState();
        Timer(Duration(seconds: 2),
		()=>showDialog(context: context, builder: (_) => RequestFailed()));
		
      
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
                        padding: const EdgeInsets.fromLTRB(0, 100, 10, 0),
                        child: Image.asset('assets/images/Group 7206.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,right:5),
                        child: Text('Please wait',style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize:20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,right: 5,left: 5),
                        child: Text('System is waiting delivery confirmation from customer',textAlign: TextAlign.center,
                        style: TextStyle(fontSize:17),),
                      ),
                      
                    ],
                  )),
            ),
          ),
        );
      }
    }