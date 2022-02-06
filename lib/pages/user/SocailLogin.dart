

import 'dart:convert';

import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/pages/user/Login.dart';
import 'package:demoapp/pages/user/registerform.dart';
import 'package:demoapp/pages/user/urlmodal.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class SocailLogin extends StatefulWidget {
  // const Login({Key? key}) : super(key: key);

  @override
  _SocailLoginState createState() => _SocailLoginState();
}

class _SocailLoginState extends State<SocailLogin> {
  bool agree = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  String userEmail = '';
  // Image ? userUrl;
  // UserDetails? userDetails;
  
  Future<UserCredential> signInWithFacebook() async {
    // String email = '';
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    if (loginResult.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData(
        fields: 'email,name,picture.type(large)',
      );
      print(userData);
      var email=userData['email'];
      var name=userData['name'];
      var imageUrl=userData['picture']['data']['url'];
      print(email);
      print(name);
      print(imageUrl);
      print("email....................");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  name: name,
                  email: email,
                  userProfile: imageUrl,
                )));
    }

    
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }



  final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name='';
String email='';
String imageUrl='';

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await auth.signInWithCredential(credential);
  final User user = authResult.user!;

  // ignore: unnecessary_null_comparison
  if (user != null) {
    // Checking if email and name is null
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName!;
    email = user.email!;
    imageUrl = user.photoURL!;

    var session=SessionManager();
    await session.set("displayName", name);
    await session.set("email", email);
    await session.set("photoURL", imageUrl);

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    assert(!user.isAnonymous);
    // ignore: unnecessary_null_comparison
    assert(await user.getIdToken() != null);

    final User currentUser = auth.currentUser!;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return '$user';
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}



  Future validateData() async {
    final isValid = formKey.currentState!.validate();
    var sessionManager = SessionManager();
    await sessionManager.set("phoneoremail", emailController.text);
    await sessionManager.set("password", passwordController.text);
    dynamic id = await SessionManager().get("phoneoremail");
    dynamic id2 = await SessionManager().get("password");
    print(id);
    print(id2);
    if (isValid) {
      formKey.currentState?.save();
      final email = emailController.text;
      final password = passwordController.text;
      print("email  " + email);
      print("password  " + password);
    } else {
      print("not valid");
    }
  }

  final postData = {
    'phoneoremail': 'sahilsharry123@gmail.com',
    'password': 'sahil@123'
  };

  Future<void> login() async {
    print(emailController.text);
    print(passwordController.text);
    if (passwordController.text != '' && emailController.text != '') {
      print(Url.url + "/login/customer");
      var response = await http
          .post(Uri.parse(Url.url + "/login/customer"), body: {
        'phoneoremail': emailController.text,
        'password': passwordController.text
      }, headers: {
        "token": "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
      });
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map map=json.decode(response.body);
        print(map);
        //         var getId=map.customer[0].id;
        // print(getId);
        // getId("getId");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Home(name: '', email: emailController.text,userProfile: '',)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid credential'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Blank Field not allowed')));
    }
  }

  

  // GoogleSignInAccount? _currentUser;
  // String _contactText = '';

  @override
  void initState() {
    super.initState();
  }

  navigate() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                userProfile: '',
                    name: '',
                    email: '',
                  )));
    });
  }

  

  // Future<void> _handleSignOut() => _googleSignIn.disconnect();

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
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/hd_logo.png')),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
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
                                borderRadius:
                                    BorderRadius.circular(30.0)),
                            elevation: 8.0,
                            minimumSize: Size(double.infinity,
                                44), // double.infinity is the width and 30 is the height
                          ),
                          onPressed: () {
                            signInWithFacebook();
                            setState(() {
                              userEmail = '$userEmail';
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8),
                            child: Text(
                                Constants.FACEBOOK.toUpperCase(),
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
                                borderRadius:
                                    BorderRadius.circular(30.0)),
                            elevation: 8.0,
                            minimumSize: Size(double.infinity,
                                44), // double.infinity is the width and 30 is the height
                          ),
                          onPressed: () {
                            signInWithGoogle().then((result) {
                              // ignore: unnecessary_null_comparison
                              if (result != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RegisterForm();
                                      // return Home(
                                      //   userProfile: imageUrl,
                                      //   email: email,
                                      //   name: name,
                                      // );
                                    },
                                  ),
                                );
                              }
                            });
                          },

                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8),
                            child: Text(
                                "Signup with gmail".toUpperCase(),
                                style: btnWhiteText),
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text.rich(TextSpan(
                              text: " Already have account ?",
                              style: headingText,
                              children: <InlineSpan>[
                                TextSpan(
                                    text: " Login",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontFamily: "Roboto",
                                      color: HexColor(orange),
                                    ),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      })
                              ])),
                        ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class EmailTextInput extends StatelessWidget {
  const EmailTextInput(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.inputType,
      required this.inputAction,
      required this.emailController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 0.75),
                    borderRadius: BorderRadius.circular(30.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                hintText: hint,
                prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      icon,
                      color: Colors.black26,
                      size: 20,
                    )),
                hintStyle: headingText),
            keyboardType: inputType,
            textInputAction: inputAction,
            style: headingText,
            controller: emailController,
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
              EmailValidator(errorText: "Enter valid email.")
            ]),
          ),
        ));
  }
}

class PasswordInputValue extends StatefulWidget {
  const PasswordInputValue(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.inputType,
      required this.inputAction,
      required this.passwordController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController passwordController;

  @override
  _PasswordInputValueState createState() => _PasswordInputValueState(
      icon, hint, inputType, inputAction, passwordController);
}

class _PasswordInputValueState extends State<PasswordInputValue> {
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController passwordController;
  bool _isObscure = true;

  _PasswordInputValueState(this.icon, this.hint, this.inputType,
      this.inputAction, this.passwordController);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 0.75),
                  borderRadius: BorderRadius.circular(30.0)),
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              hintText: hint,
              suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  icon,
                  color: Colors.black26,
                  size: 20,
                ),
              ),
              hintStyle: headingText,
            ),
            controller: passwordController,
            keyboardType: inputType,
            textInputAction: inputAction,
            obscureText: _isObscure,
            style: headingText,
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
              MinLengthValidator(6, errorText: "Atleast 6 char required.")
            ]),
          ),
        ));
  }
}
