// import 'dart:async';

import 'package:demoapp/utlis/platte.dart';
import 'package:demoapp/utlis/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:http/http.dart'as http;
// import 'package:demoapp/pages/user/urlmodal.dart';
class ResetPasswordOtp extends StatefulWidget {
  const ResetPasswordOtp({Key? key}) : super(key: key);
  @override
  _ResetPasswordOtpState createState() => _ResetPasswordOtpState();
}

class _ResetPasswordOtpState extends State<ResetPasswordOtp> {

  TextEditingController mobileController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // validateData() async {
  //   final isValid = formKey.currentState!.validate();



  //   if (isValid) {
  //     formKey.currentState?.save();
  //     print("Mobile  " + mobileController.text);
  //     print("username  " + usernameController.text);
  //     setState(() {
  //       Navigator.pushNamed(context, MyRoutes.saveResetPassword);
  //   });

  //   } else {
  //     print("not valid");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getId();
  }

  getId() async {
    dynamic id = await SessionManager().get("userId");
    print(id);
  }

  validateData() async {
    dynamic id = await SessionManager().get("userId");
    print(id);
    // var verificationcode = '';
    final isValid = formKey.currentState!.validate();
    var sessionManager = SessionManager();

    await sessionManager.set("verification_code", mobileController.text);
    if (isValid) {
      formKey.currentState?.save();
      print("verification_code  " + mobileController.text);
      setState(() {
        Navigator.pushNamed(context, MyRoutes.saveResetPassword);
        // if (mobileController.text != verificationcode) {
        // Timer(Duration(seconds: 30), () {
        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     content: ElevatedButton(
        //         onPressed: () async {
        //           var sendVerifyOtp = await http.get(
        //               Uri.parse(
        //                   Url.url + "/email/customerVerificationCode/{$id}"),
        //               headers: {
        //                 "token":
        //                     "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
        //               });
        //           print(sendVerifyOtp);
        //           print(sendVerifyOtp.statusCode);
        //           print("sendVerifyOtp");
        //           if(sendVerifyOtp.statusCode==200){
        //             ScaffoldMessenger.of(context).showSnackBar(
        //               SnackBar(content: Text('Email Sent again')));
        //           }else{
        //             ScaffoldMessenger.of(context).showSnackBar(
        //               SnackBar(content: Text('Email not sent')));
        //           }
                  
        //         },
        //         child: Text('resend Otp')),
        //   ));
        // });}
        // Navigator.pushNamed(context, MyRoutes.saveResetPassword);
      });
    } else {
      print("not valid");
    }
    // if (mobileController.text != verificationcode) {
    //   return {
    //     print('try again'),
    //     Timer(Duration(seconds: 1), () {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //         content: Text('wrong otp, try again'),
    //       ));
    //     })
    //   };
    // } else {
    //   Navigator.pushNamed(context, MyRoutes.saveResetPassword);
    // }
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
                  child:  Container( padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 0),
                    child:
                    Form(
                        key: formKey,
                        child: Column(

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,30.0),
                                  child: Text( "Please enter your OTP code ",
                                    textAlign: TextAlign.center,
                                    style: headingText,textScaleFactor: 1,
                                  ),
                                ),
                                MobileInput(
                                  hint: "Enter OTP",
                                  inputType: TextInputType.number,
                                  inputAction: TextInputAction.next,
                                  mobileController: mobileController,
                                ),
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
                                        validateData();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SaveResetPassword()));
                                      },
                                      child:
                                      Text("Verify".toUpperCase(), style: btnWhiteText),
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



class MobileInput extends StatelessWidget {
  const MobileInput(
      {Key? key,
        required this.hint,
        required this.inputType,
        required this.inputAction,
        required this.mobileController})
      : super(key: key);

  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          // decoration: BoxDecoration(
          //     color: Colors.grey[600]!.withOpacity(0.5),
          //     borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            maxLength: 6,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              counterStyle: TextStyle(
                height: double.minPositive,
              ),
              counterText: "",
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 0.75),borderRadius: BorderRadius.circular(30.0) ),
              contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 20),
              hintText: hint,
            ),
            keyboardType: TextInputType.number,
            textInputAction: inputAction,
            style: headingText,
            controller: mobileController,
            validator: RequiredValidator(errorText: "Required"),
          ),
        ));
  }
}
