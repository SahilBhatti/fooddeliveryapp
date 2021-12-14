// import 'dart:async';
// import 'package:demoapp/pages/login/login.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFf4b705)),
      home: new MyHomePage(),
    );
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
// @override
// void initState() {
// 	super.initState();
// 	Timer(Duration(seconds: 5),
// 		()=>Navigator.pushReplacement(context,
// 										MaterialPageRoute(builder:
// 														(context) =>
// 														LoginPage()
// 														)
// 									)
// 		);
// }
@override
Widget build(BuildContext context) {
	return Scaffold(
    body: Column(
      children: [
        Image.asset('assets/images/Untitled-1logo(1).png', height: 200, width: 200,),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
            child: 
            DottedBorder(
                    child: Text('33*33', style: TextStyle(color:Colors.black),),
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  // dashPattern: [80,50,60,50],
                  radius: Radius.circular(20),
                  dashPattern: [6, 3, 2, 3],
                  // trailing: Image.asset('assets/images/Path 24317.png'),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
      top: BorderSide(width: 6.0, color: Colors.white),
      bottom: BorderSide(width: 5.0, color: Colors.white),
      left: BorderSide(width: 5.0, color: Colors.white),
      right: BorderSide(width: 5.0, color: Colors.white),
      
    ),),
            // decoration: BoxDecoration(borderRadius:BorderRadius.only(topRight: Radius.circular(40.0),
            //         bottomRight: Radius.circular(40.0),), color:Colors.white,),
          ),
        ),
      ],
    ),
	);
}
}

