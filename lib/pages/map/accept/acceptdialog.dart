import 'package:demoapp/pages/map/decline/declinedialog.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class AcceptDialog extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => AcceptDialogState();
    }

    class AcceptDialogState extends State<AcceptDialog>
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
                      Padding(
                        padding: const EdgeInsets.only(
                        top: 30.0, left: 20.0, right: 20.0),
                        child: Text(
                      "Are You Sure ?",
                      style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Text(
                        "You're the best FooDoorer for this order!",textAlign:( TextAlign.center),
                      ),
                          Text(
                            "48%",style: TextStyle(fontSize:50, fontWeight:FontWeight.w200, color: Colors.red),
                          ),
                          Text(
                            "Consistently accept delivery opportunities to rise your Acceptance",textAlign:( TextAlign.center),
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                      DottedBorder(child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('Go Back',style: TextStyle(color:Colors.blue),), ),
                        ),
                        radius: Radius.circular(10),
                  borderType: BorderType.RRect,
                  color: Colors.blue,),
                      DottedBorder(child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child:TextButton(
                          onPressed: ()async{
                            Navigator.pop(context);
                          showDialog(
        context: context,
        builder: (_) => Decline(),
      );
      
                          // await AlertDialogs.yesCancelDialog(context, 'Are you sure', 'You are the best FooDoorer for this Order!');
                        },
                        
                          child: Text('Decline',style: TextStyle(color:Colors.red),), ),
                      ),
                      radius: Radius.circular(10),
                  borderType: BorderType.RRect,
                  color: Colors.red,),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        );
      }
    }