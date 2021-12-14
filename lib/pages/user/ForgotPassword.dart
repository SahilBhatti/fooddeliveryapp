import 'package:country_code_picker/country_code_picker.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:demoapp/utlis/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mobileController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  validateData() async {
    final isValid = formKey.currentState!.validate();



    if (isValid) {
      formKey.currentState?.save();
      print("OTP  " + mobileController.text);
      setState(() {
        Navigator.pushNamed(context, MyRoutes.otpVerify);
    });

    } else {
      print("not valid");
    }
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
                                    "Enter your mobile number we'll send you a OTP message. ",
                                    textAlign: TextAlign.center,
                                    style: headingText,textScaleFactor: 1,
                                  ),
                                ),
                                MobileInput(
                                  icon: CupertinoIcons.phone,
                                  hint: "0000-0000-0000",
                                  inputType: TextInputType.number,
                                  inputAction: TextInputAction.next,
                                  mobileController: mobileController,
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
