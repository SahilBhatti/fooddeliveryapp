import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:demoapp/pages/user/ResetPasswordOtp.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart'as http;
import 'package:demoapp/pages/user/urlmodal.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  validateData() async {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState?.save();
      print("OTP  " + mobileController.text);
      print("OTP  " + emailController.text);
      setState(() {
        // Navigator.pushNamed(context, MyRoutes.resetPassword);
      });
    } else {
      print("not valid");
    }
  }

  verify() async {
    var checkCustresponse = await http
        .post(Uri.parse(Url.url + "/customer/checkcustomeralready"), body: {
      "email": emailController.text,
    }, headers: {
      "token": "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
    });
    print(checkCustresponse);
    var checkCust = jsonDecode(checkCustresponse.body);
    print(checkCust['userId']);
    var encryptedid = checkCust['userId'];
    print(checkCustresponse.body);
    print(checkCustresponse.statusCode);
    print("check");
    if (encryptedid != null) {
       _onLoading();
      var sendVerifyOtp = await http.get(
          Uri.parse(Url.url + "/email/customerVerificationCode/{$encryptedid}"),
          headers: {
            "token":
                "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
          });
      print(checkCustresponse);
      print("checkCustresponse");
      print(sendVerifyOtp.body);
      print(sendVerifyOtp.statusCode);
      print("sendVerifyOtp");
      var sessionManager = SessionManager();
      await sessionManager.set("userId", encryptedid);
      // dynamic id = await SessionManager().get("userId");
      // print(id);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email Sent')));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordOtp()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email not Sent')));
    }
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
  new Future.delayed(new Duration(seconds: 6), () {
    Navigator.pop(context); //pop dialog
    // _login();
  });
}
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
                  child:  Container( padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 0),
                    child:
                    Form(
                        key: formKey,
                        child: Column(

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,30.0),
                                  child: Text(
                                    "Enter your Email Id we'll send you a OTP message. ",
                                    textAlign: TextAlign.center,
                                    style: headingText,textScaleFactor: 1,
                                  ),
                                ),
                                // MobileInput(
                                //   icon: CupertinoIcons.phone,
                                //   hint: "0000-0000-0000",
                                //   inputType: TextInputType.number,
                                //   inputAction: TextInputAction.next,
                                //   mobileController: mobileController,
                                // ),
                                Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: EmailTextInput(
                                icon: CupertinoIcons.envelope_fill,
                                hint: "Email",
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                emailController: emailController,
                              ),
                            ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:  Color(0xFFf66b00),
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
                                        verify();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ResetPasswordOtp()));
                                      },
                                      child:
                                      Text("Submit".toUpperCase(), style: btnWhiteText),
                                    )),
                              ],
                            ),

                          ],
                        )),
                  ),
                ),


              ],
            )

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
