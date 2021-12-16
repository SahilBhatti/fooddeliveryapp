import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:customer_app/views/loginwithfacebook/login.dart';

import 'Login.dart';


class SocailLogin extends StatefulWidget {

  const SocailLogin({Key? key}) : super(key: key);

  @override
  _SocailLoginState createState() => _SocailLoginState();
}

class _SocailLoginState extends State<SocailLogin> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // GoogleSignInAccount? user =_googleSignIn.currentUser;
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
                              Padding(
                                padding: const EdgeInsets.only(top:8,bottom:8),
                                child: Text(Constants.FACEBOOK.toUpperCase(), style: btnWhiteText),
                              ),
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
                              Padding(
                                padding: const EdgeInsets.only(top:8,bottom:8),
                                child: Text("Signup with email".toUpperCase(), style: btnWhiteText),
                              ),
                            )),

                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:HexColor(orange),
                                  onPrimary:Colors.black,
                                  minimumSize:Size(double.infinity,50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(30.0)),
                                elevation: 8.0,
                                ),
                                onPressed: ()async{
                                    await _googleSignIn.signIn();
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (context) =>
                                            Home())
                                );
                              });
                                }, 
                              child: Text('SignUp With Google'.toUpperCase(),style: btnWhiteText,)),
                            )
                            
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
