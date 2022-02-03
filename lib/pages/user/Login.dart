import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:demoapp/pages/Wallet/AddPaypalAddress/AddPaypalAddress.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:demoapp/pages/user/ForgotPassword.dart';
import 'package:demoapp/utlis/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart'as http;
import 'package:demoapp/pages/user/urlmodal.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>with SingleTickerProviderStateMixin{
  TabController ?tabController;
  bool agree = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
TextEditingController mobileController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();

 
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
      // setState(() {
      //   if (id == email && id2 == password) {
      //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> Home(name: '', email: emailController.text)));
      //   } else {
      //     print(" valid122");
      //   }
      // });
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
      print(Url.url+"/login/customer");
      var response = await http.post(
          Uri.parse(Url.url+"/login/customer"),
          body: {
        'phoneoremail': emailController.text,
        'password': passwordController.text
      },
          headers: {
            "token":
                "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
          });
          print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
              Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Home(userProfile: '',email: '',name: '',)));
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


  validateData2() async {
    final isValid = formKey.currentState!.validate();
    var sessionManager = SessionManager();
    await sessionManager.set("username", usernameController.text);
    await sessionManager.set("phoneoremail", emailController.text);
    await sessionManager.set("password", passwordController.text);
    await sessionManager.set("phone", mobileController.text);
    dynamic id = await SessionManager().get("username");
    dynamic id2 = await SessionManager().get("phoneoremail");
    dynamic id3 = await SessionManager().get("password");
    dynamic id4 = await SessionManager().get("phone");
    print(id);
    print(id2);
    print(id3);
    print(id4);
    if (isValid) {
      formKey.currentState?.save();
      print("username  " + usernameController.text);
      print("phone  " + mobileController.text);
      print("email  " + emailController.text);
      print("password  " + passwordController.text);
      setState(() {
        // Navigator.pushNamed(context, MyRoutes.otpVerify);
      });
    } else {
      print("not valid");
    }
  }

  Future<void> register() async {
    _onLoading();
    print(passwordController.text);
    if (passwordController.text != '' &&
        emailController.text != '' &&
        usernameController.text != '' &&
        mobileController.text != '') {
      print("66666666");
      var response = await http
          .post(Uri.parse(Url.url + "/customer/checkcustomeralready"), body: {
        "email": emailController.text,
        "phone": mobileController.text
      }, headers: {
        "token": "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
      });
      print(response.statusCode);
      var tagsJson = jsonDecode(response.body);
      print(tagsJson['message']);
      if (response.statusCode == 200) {
        if (tagsJson['message'] == 'phone') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('phone no. already exit')));
          print('phone no. already exit');
        } else if (tagsJson['message'] == 'email') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('email already exit')));
          print('email already exist');
        } else if (tagsJson['message'] == 'itsnewcustomer') {
          final postData = {
            "first_Name": usernameController.text,
            "last_Name": usernameController.text,
            "phone": mobileController.text,
            "email": emailController.text,
            "password": passwordController.text,
          };

          var newCustresponse = await http
              .post(Uri.parse(Url.url + "/customer"), body: postData, headers: {
            "token":
                "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
          });

          var newCustJson = jsonDecode(newCustresponse.body);
          var encryptedid = newCustJson['customer']['encryptedid'];

          print(encryptedid);
          var sessionManager = SessionManager();
    await sessionManager.set("userId", encryptedid);

          var customerCreatedres = await http.get(
            Uri.parse(Url.url + "/email/customerCreated/{$encryptedid}"),
            headers: {
              'token':
                  'Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks',
            },
          );
          print(customerCreatedres.statusCode);
          if (customerCreatedres.statusCode == 201 ||
              customerCreatedres.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Email Successfully Sent')));
                _onLoading2();
            var otp = await http.get(
              Uri.parse(Url.url +
                  "/email/customerAccountVerificationCode/{$encryptedid}"),
              headers: {
                'token':
                    'Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks',
              },
            );
            print("otp");
            print(otp.body);
            if (otp.statusCode == 200) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Otp sent')));
              Navigator.pushNamed(context, MyRoutes.otpVerify);
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Otp not sent')));
            }
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Email not Sent')));
          }
        }
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

 
final List<Tab> tabs = <Tab>[
      Tab(text: 'Page1'),
      Tab(text: 'Page2'),
    ];

@override
      void initState() {
        super.initState();
        tabController = new TabController(vsync: this, length: tabs.length);
      }
    
      @override
      void dispose() {
        tabController!.dispose();
        super.dispose();
      }
void _onLoading() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Theme(
            data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
              child: Dialog(
          child: Padding(
            padding: const EdgeInsets.only(top:10,bottom:10,left:20),
            child: Row(
              children: [
                new CircularProgressIndicator(),
                Padding(
                   padding: const EdgeInsets.only(left:20),
                  child: new Text("Loading..."),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  new Future.delayed(new Duration(seconds: 10), () {
    Navigator.pop(context); //pop dialog
    // _login();
  });
}

  void _onLoading2() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Theme(
            data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
              child: Dialog(
          child: Padding(
            padding: const EdgeInsets.only(top:10,bottom:10,left:20),
            child: Row(
              children: [
                new CircularProgressIndicator(),
                Padding(
                   padding: const EdgeInsets.only(left:20),
                  child: new Text("Loading..."),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  new Future.delayed(new Duration(seconds: 3), () {
    Navigator.pop(context); //pop dialog
    // _login();
  });
}

      
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // construct the profile details widget here
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: Image.asset('assets/images/hd_logo.png',height:150,width: 150,),
                  ),
                )),

            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: Colors.white,
                bottom: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'Login',
                    ),
                    Tab(
                      text: 'Signup',
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [

                  // first tab bar view widget
                  SingleChildScrollView(
                    child: SafeArea(
                        child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        EmailTextInput(
                                          icon: CupertinoIcons.envelope_fill,
                                          hint: "Email",
                                          inputType: TextInputType.emailAddress,
                                          inputAction: TextInputAction.next,
                                          emailController: emailController,
                                        ),
                                        PasswordInputValue(
                                          icon: CupertinoIcons.lock_fill,
                                          hint: "Password",
                                          inputType: TextInputType.emailAddress,
                                          inputAction: TextInputAction.done,
                                          passwordController: passwordController,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(top: 20),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFf66b00),
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
                                                validateData();
                                                login();
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             Home()));
                                              },
                                              child: Text("Login".toUpperCase(),
                                                  style: btnWhiteText),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Text.rich(TextSpan(
                                              text: "",
                                              style: headingText,
                                              children: <InlineSpan>[
                                                TextSpan(
                                                    text: "Forgot Password ?",
                                                    style: headingText,
                                                    recognizer: new TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ForgotPassword()));
                                                      })
                                              ])),
                                        ),
                                        
                                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Align(
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white, width: 1))),
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: Text.rich(TextSpan(
                                        text: " Dont have any account ?",
                                        style: headingText,
                                        children: <InlineSpan>[
                                          TextSpan(
                                              text: " Signup",
                                              style: TextStyle(
                                                decoration: TextDecoration.underline,
                                                fontSize: 14,
                                                fontFamily: "Roboto",
                                                color: Color(0xFFf66b00),
                                              ),
                                              recognizer: new TapGestureRecognizer()
                                                ..onTap = () {
                                                  tabController?.animateTo(1);
                                                })
                                        ])),
                                  )),
                            )),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    )),
                  ),

                  // second tab bar viiew widget
                  SingleChildScrollView(
                                      child: Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.60,
              child: Container(
                padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child:
                Form(
                        key: formKey2,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                UsernameInput(
                                  icon: CupertinoIcons.profile_circled,
                                  hint: "Username",
                                  inputType: TextInputType.name,
                                  inputAction: TextInputAction.next,
                                  userNameController: usernameController,
                                ),

                                MobileInput(
                                  icon: CupertinoIcons.phone,
                                  hint: "0000-0000-0000",
                                  inputType: TextInputType.number,
                                  inputAction: TextInputAction.next,
                                  mobileController: mobileController,
                                ),

                                EmailTextInput(
                                  icon: CupertinoIcons.envelope_fill,
                                  hint: "Email",
                                  inputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.next,
                                  emailController: emailController,
                                ),
                                PasswordInputValue(
                                  icon: CupertinoIcons.lock_fill,
                                  hint: "Password",
                                  inputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.done,
                                  passwordController: passwordController,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFf66b00),
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
                                        validateData2();
                                        register();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             OtpVerification()));
                                      },
                                      child: Text("Signup".toUpperCase(),
                                          style: btnWhiteText),
                                    )),

                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text.rich(TextSpan(text: "Already have account ?",
                                      style: headingText,
                                      children: <InlineSpan>[
                                        TextSpan(
                                            text: " Login",
                                            style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              fontSize: 14,
                                              fontFamily: "Roboto",
                                              color: Color(0xFFf66b00),
                                            ),
                                            recognizer: new TapGestureRecognizer()
                                              ..onTap = () {
                                                tabController?.animateTo(0);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) => Login()));
                                              })
                                      ])),
                                )

                              ],
                            ),
                          ],
                        )),
              ),
            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

class MobileInput extends StatelessWidget {
  const MobileInput(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.inputType,
      required this.inputAction,
      required this.mobileController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child:GestureDetector(
          child: Stack(
            children: [
              Container(child:
                TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26, width: 0.75),
                      borderRadius: BorderRadius.circular(30.0)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  hintText: hint,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 54.0),
                    // child: Icon(  icon,  color: Colors.black26,size: 20,)
                  ),
                ),
                keyboardType: TextInputType.number,
                textInputAction: inputAction,
                style: headingText,
                controller: mobileController,
                validator: RequiredValidator(errorText: "Required"),
              ),
              ),
              SizedBox(
              width: 140,
              child:
              CountryCodePicker(
                onChanged: print,
                initialSelection: 'IT',
                favorite: ['+39','FR'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: true,
                flagWidth: 20,
                textStyle: headingText,
                dialogTextStyle: headingText,
              ),
            )
            ],
          ),
        )

    );
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