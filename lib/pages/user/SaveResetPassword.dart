import 'package:demoapp/utlis/platte.dart';
import 'package:demoapp/utlis/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class SaveResetPassword extends StatefulWidget {
  const SaveResetPassword({Key? key}) : super(key: key);

  @override
  _SaveResetPasswordState createState() => _SaveResetPasswordState();
}

class _SaveResetPasswordState extends State<SaveResetPassword> {
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  validateData() async {
    final isValid = formKey.currentState!.validate();



    if (isValid) {
      formKey.currentState?.save();
      print("password  " + passwordController.text);
      setState(() {
        Navigator.pushNamed(context, MyRoutes.loginRoute);
    });

    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    "Enter your new password and then click on save button below. ",
                                    textAlign: TextAlign.center,
                                    style: headingText,textScaleFactor: 1,
                                  ),
                                ),
                                PasswordInput(
                                  icon: CupertinoIcons.lock_fill,
                                  hint: "Reset password",
                                  inputType: TextInputType.emailAddress,
                                  inputAction: TextInputAction.done,
                                  passwordController: passwordController,
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
                                        //             Login()));
                                      },
                                      child:
                                      Text("Save password".toUpperCase(), style: btnWhiteText),
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


class PasswordInput extends StatelessWidget {
  const PasswordInput(
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
  Widget build(BuildContext context) {
    return
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child:
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                // enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.black26,width: 1.0),),
                // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 1.0)),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 0.75),borderRadius: BorderRadius.circular(30.0) ),
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
                hintText: hint,

                prefixIcon: Padding(  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(     icon,  color: Colors.black26,size: 20, ),   ),
                hintStyle: headingText,
              ),
              controller: passwordController,
              keyboardType: inputType,
              textInputAction: inputAction,
              obscureText: true,
              style: headingText,
              validator: MultiValidator([
                RequiredValidator(errorText: "Required"),
                MinLengthValidator(6, errorText: "Atleast 6 char required.")
              ]),
            ),
          ));
  }
}
