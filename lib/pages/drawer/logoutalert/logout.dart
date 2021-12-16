import 'package:demoapp/pages/user/SocailLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';




class Logout extends StatefulWidget {
      @override
      State<StatefulWidget> createState() => LogoutState();
    }

    class LogoutState extends State<Logout>
        with SingleTickerProviderStateMixin {
          GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
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
                      Image.asset('assets/images/hd_logo.png',height:150,width: 150,),
                      Text('Want to Logout ?',style: TextStyle(fontWeight:FontWeight.bold, fontSize:20),),
                      Padding(
                        padding: const EdgeInsets.only(top:50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          },
                            child: Padding(
                              padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                              child: Text('Cancel'.toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,)),
                            ),),
                            ElevatedButton(onPressed: ()async{
                              await _googleSignIn.signOut();
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SocailLogin()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left:30,right:30,top:5,bottom:5),
                              child: Text('Ok'.toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,),),
                            )
                        )]),
                      )
                    ],
                  )),
            ),
          ),
        );
      }
    }