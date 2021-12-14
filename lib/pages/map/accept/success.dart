import 'dart:ui';

import 'package:demoapp/pages/map/confirm/confirmdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Success extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SuccessState();
}

class SuccessState extends State<Success> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              padding: EdgeInsets.only(left: 15, top: 0),
              height: 400.0,
              width: 280.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 10, 0),
                    child: Image.asset('assets/images/checked (2).png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 5),
                    child: Text(
                      'SUCCESS!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: Text(
                      'Delivery has been completed successfully.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height:30),
                  Center(
                    child: Container(
                      child: OutlinedButton(
                        onPressed: () => {
                          Navigator.pop(context),
                          showDialog(
                            context: context,
                            builder: (_) => ConfirmDelivery(),
                          )
                        },
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
                            child: Text('Okay!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ))),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
