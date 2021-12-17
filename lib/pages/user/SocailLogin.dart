import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
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
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
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
                              onPressed: ()async {
                                signInWithFacebook();
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
                              child:
                              Padding(
                                padding: const EdgeInsets.only(top:8,bottom:8),
                                child: Text("Signup with email".toUpperCase(), style: btnWhiteText),
                              ),
                            )),

                            // Container(
                            //   margin: const EdgeInsets.only(top: 20),
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       primary:HexColor(orange),
                            //       onPrimary:Colors.black,
                            //       minimumSize:Size(double.infinity,50),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius:
                            //         BorderRadius.circular(30.0)),
                            //     elevation: 8.0,
                            //     ),
                            //     onPressed: ()async{
                            //         await _googleSignIn.signIn();
                            //   setState(() {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder:
                            //                 (context) =>
                            //                 Home())
                            //     );
                            //   });
                            //     }, 
                            //   child: Text('SignUp With Google'.toUpperCase(),style: btnWhiteText,)),
                            // )
                            
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












// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

// import 'dart:async';
// import 'dart:convert' show json;

// import "package:http/http.dart" as http;
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(
//   // Optional clientId
//   // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
//   scopes: <String>[
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Google Sign In',
//       home: SocailLogin(),
//     ),
//   );
// }

// class SocailLogin extends StatefulWidget {
//   @override
//   State createState() => SocailLoginState();
// }

// class SocailLoginState extends State<SocailLogin> {
//   GoogleSignInAccount? _currentUser;
//   String _contactText = '';

//   @override
//   void initState() {
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
//       setState(() {
//         _currentUser = account;
//       });
//       if (_currentUser != null) {
//         _handleGetContact(_currentUser!);
//       }
//     });
//     _googleSignIn.signInSilently();
//   }

//   Future<void> _handleGetContact(GoogleSignInAccount user) async {
//     setState(() {
//       _contactText = "Loading contact info...";
//     });
//     final http.Response response = await http.get(
//       Uri.parse('https://people.googleapis.com/v1/people/me/connections'
//           '?requestMask.includeField=person.names'),
//       headers: await user.authHeaders,
//     );
//     if (response.statusCode != 200) {
//       setState(() {
//         _contactText = "People API gave a ${response.statusCode} "
//             "response. Check logs for details.";
//       });
//       print('People API ${response.statusCode} response: ${response.body}');
//       return;
//     }
//     final Map<String, dynamic> data = json.decode(response.body);
//     final String? namedContact = _pickFirstNamedContact(data);
//     setState(() {
//       if (namedContact != null) {
//         _contactText = "I see you know $namedContact!";
//       } else {
//         _contactText = "No contacts to display.";
//       }
//     });
//   }

//   String? _pickFirstNamedContact(Map<String, dynamic> data) {
//     final List<dynamic>? connections = data['connections'];
//     final Map<String, dynamic>? contact = connections?.firstWhere(
//       (dynamic contact) => contact['names'] != null,
//       orElse: () => null,
//     );
//     if (contact != null) {
//       final Map<String, dynamic>? name = contact['names'].firstWhere(
//         (dynamic name) => name['displayName'] != null,
//         orElse: () => null,
//       );
//       if (name != null) {
//         return name['displayName'];
//       }
//     }
//     return null;
//   }

//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future<void> _handleSignOut() => _googleSignIn.disconnect();

//   Widget _buildBody() {
//     GoogleSignInAccount? user = _currentUser;
//     if (user != null) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ListTile(
//             leading: GoogleUserCircleAvatar(
//               identity: user,
//             ),
//             title: Text(user.displayName ?? ''),
//             subtitle: Text(user.email),
//           ),
//           const Text("Signed in successfully."),
//           Text(_contactText),
//           ElevatedButton(
//             child: const Text('SIGN OUT'),
//             onPressed: _handleSignOut,
//           ),
//           ElevatedButton(
//             child: const Text('REFRESH'),
//             onPressed: () => _handleGetContact(user),
//           ),
//         ],
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           const Text("You are not currently signed in."),
//           ElevatedButton(
//             child: const Text('SIGN IN'),
//             onPressed: _handleSignIn,
//           ),
//         ],
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Sign In'),
//         ),
//         body: ConstrainedBox(
//           constraints: const BoxConstraints.expand(),
//           child: _buildBody(),
//         ));
//   }
// }