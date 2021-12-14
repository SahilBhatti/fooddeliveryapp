// // import 'dart:html';

// import 'package:demoapp/pages/login/login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget{
//   const Splash({Key? key}): super(key:key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   final _navigationtohome;

//   void initState(){
//     super.initState();
//     _navigationtohome();
//   }

//   _navigatetohome()async{
//     await Future.delayed(Duration(milliseconds:1500),(){});
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
//   }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center(
//         child:Container(
//           child: Image.asset('assets/images/latest-logo.png'),
//         )
//       ),
//     );
//   }
// }




// import 'dart:async';
// import 'package:demoapp/pages/map/lookingfororders.dart';
import 'package:flutter/material.dart';
// import 'home.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  var size,height,width;
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => Order())));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset('assets/images/latest-logo.png'),
        ),
      ),
    );
  }
}