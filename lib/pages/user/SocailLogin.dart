import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:customer_app/views/loginwithfacebook/login.dart';

import 'Login.dart';


class SocailLogin extends StatefulWidget {

  const SocailLogin({Key? key}) : super(key: key);

  @override
  _SocailLoginState createState() => _SocailLoginState();
}

class _SocailLoginState extends State<SocailLogin> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(

        child: SafeArea(
            child:Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child:
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:   Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage( 'assets/images/hd_logo.png') ),),

                          ),
                        )
                    ),
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child:  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child:
                    Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:  HexColor(blue),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                elevation: 8.0,
                                minimumSize: Size(double.infinity,
                                    44), // double.infinity is the width and 30 is the height
                              ),
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Facebook()));
                                // validateData();
                              },
                              child:
                              Text(Constants.FACEBOOK.toUpperCase(), style: btnWhiteText),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:  HexColor(orange),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                elevation: 8.0,
                                minimumSize: Size(double.infinity,
                                    44), // double.infinity is the width and 30 is the height
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (context) =>
                                            Login())
                                );
                              },
                              child:
                              Text("Signup with email".toUpperCase(), style: btnWhiteText),
                            )),

                      ],
                    )
                  ),
                ),


              ],
            )

        ),
      ),
    );
  }
}