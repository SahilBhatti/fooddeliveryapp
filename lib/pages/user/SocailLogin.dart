import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/pages/user/Login.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';

class SocailLogin extends StatefulWidget {
  const SocailLogin({Key? key}) : super(key: key);

  @override
  _SocailLoginState createState() => _SocailLoginState();
}

class _SocailLoginState extends State<SocailLogin> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    String userEmail = '';
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final userData = await FacebookAuth.instance.getUserData();
    userEmail = userData['email'];
    print(userEmail);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/hd_logo.png')),
                        ),
                      ),
                    )),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor(blue),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              elevation: 8.0,
                              minimumSize: Size(double.infinity,
                                  44), // double.infinity is the width and 30 is the height
                            ),
                            onPressed: () async {
                              signInWithFacebook();
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> Facebook()));
                              // validateData();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(Constants.FACEBOOK.toUpperCase(),
                                  style: btnWhiteText),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor(orange),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              elevation: 8.0,
                              minimumSize: Size(double.infinity,
                                  44), // double.infinity is the width and 30 is the height
                            ),
                            onPressed: () async {
                              await _googleSignIn.signIn();
                              setState(() {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder:
                                //             (context) =>
                                //             Home())
                                // );
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text("Signup with google".toUpperCase(),
                                  style: btnWhiteText),
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text('Already have Account? Login',
                              style: TextStyle(
                                  decoration: TextDecoration.underline)))
                    ],
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
