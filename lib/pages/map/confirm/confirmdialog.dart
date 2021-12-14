import 'dart:ui';

import 'package:demoapp/pages/map/confirm/customerconfirmation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class ConfirmDelivery extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => ConfirmDeliveryState();
    }

    class ConfirmDeliveryState extends State<ConfirmDelivery>
        with SingleTickerProviderStateMixin {
    late  final AnimationController controller;
     late final Animation<double> scaleAnimation;

      @override
      void initState() {
        super.initState();

        controller =
            AnimationController(vsync: this, duration: Duration(milliseconds: 450));
        scaleAnimation =
            CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

        controller.addListener(() {
          setState(() {});
        });

        controller.forward();
      }

      bool pressAttention=false;

      @override
      Widget build(BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 100),
          child: Container(
              
              child: DottedBorder(
                
                    child: Container(
                      // alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(30),color:pressAttention==false?Colors.red:Colors.grey,
                      ),
                      child: Padding(
              padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
              child:TextButton(onPressed: (){
                setState(() {
                  pressAttention=true;
                showDialog(
        context: context,
        builder: (_) => CustomerConfirmation(),
      );
                });
              },child: Text('Confirm Delivery',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize:15,color:Colors.white
                ),),) ),
              ),
                      
                      
                  color: Colors.white,
                  strokeWidth: 10,
                  borderType: BorderType.RRect,
                  dashPattern: [160,160],
                  radius: Radius.circular(30),
                  ),
                decoration: BoxDecoration(
        color: Colors.transparent,
                boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(2,2),
                  blurRadius: 1.0,
                ),
                ],
              ), 
                  
          ),
        ),
                ],
              ),
            ),
          ),
        );
      }
    }