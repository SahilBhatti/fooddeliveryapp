import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:demoapp/pages/map/map1.dart';

class Decline extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => DeclineState();
    }

    class DeclineState extends State<Decline>
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

      @override
      Widget build(BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                  padding: EdgeInsets.only(left:15,top:0),
                  height: 450.0,
                  width: 280.0,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:30,bottom: 20),
                        child: ListTile(
                          title: Text(
                          "Tell us Why?",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        ),
                      ),

                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Text('Distance is too far'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:90),
                            child: Image.asset('assets/images/Right Detail.png'),
                          )
                        ]
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text('Store is not in my starting'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:45),
                              child: Image.asset('assets/images/Right Detail.png'),
                            )
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text('The order is too small'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:70),
                              child: Image.asset('assets/images/Right Detail.png'),
                            )
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text('I dont want to place order'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:47),
                              child: Image.asset('assets/images/Right Detail.png'),
                            )
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text('I dont want to go to this'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:60
                              ),
                              child: Image.asset('assets/images/Right Detail.png'),
                            )
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Row(
                          children:[
                            Padding(
                              padding: const EdgeInsets.only(left:20),
                              child: Text('I dont too many orders'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:67),
                              child: Image.asset('assets/images/Right Detail.png'),
                            )
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                        DottedBorder(child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text('Go Back',style: TextStyle(color:Colors.black),), ),
                          ),
                          radius: Radius.circular(10),
                  borderType: BorderType.RRect,
                  color: Colors.grey,
                  dashPattern: [10,10],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10),
                    child: Container(
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
                        color: Colors.red),
                        child: TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> GetLocation()));
                          },
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                        child: Text('Submit',style: TextStyle(color:Colors.white),),
                          ), ),
                    ),
                  ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right:10),
                        //   child:Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius:BorderRadius.circular(10),
                        //       color:Colors.red
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        //       child: TextButton(
                        //         onPressed: (){
                                  
                        //         },
                        //         child: TextButton(
                        //           onPressed: (){},
                        //           child: Text('Submit',style: TextStyle(color:Colors.white),),), ),
                        //     ),
                        //   ),
                        // ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
        );
      }
    }