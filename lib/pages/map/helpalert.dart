
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class Help extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => HelpState();
    }

    class HelpState extends State<Help>
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
                margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(15.0),
                  height: 350.0,
                  width: 280.0,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[
                          IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Image.asset('assets/images/Group 13910.png'))
                        ]
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                            child: Text('Help',style: TextStyle(fontWeight:FontWeight.bold,
                            fontSize: 20),),
                          ),
                          Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Text('Cant reach the Customer'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:37),
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
                              child: Text('Continue to FooDooring'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:45),
                              child: Image.asset('assets/images/Right Detail.png'),
                            )
                          ]
                        ),
                      ),
                     
                        ]
                      )
                    ],
                  )),
            ),
          ),
        );
      }
    }