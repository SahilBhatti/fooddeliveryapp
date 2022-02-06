import 'package:demoapp/utlis/platte.dart';
import 'package:demoapp/utlis/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart'as http;
import 'package:demoapp/pages/user/urlmodal.dart';

class SaveResetPassword extends StatefulWidget {
  const SaveResetPassword({Key? key}) : super(key: key);

  @override
  _SaveResetPasswordState createState() => _SaveResetPasswordState();
}

class _SaveResetPasswordState extends State<SaveResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // validateData() async {
  //   final isValid = formKey.currentState!.validate();



  //   if (isValid) {
  //     formKey.currentState?.save();
  //     print("password  " + passwordController.text);
  //     setState(() {
  //       Navigator.pushNamed(context, MyRoutes.loginRoute);
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
    dynamic id2 = await SessionManager().get("verification_code");
    print(id);
    print(id2);
    print("id2");
  }

  validateData() async {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState?.save();
      print("password  " + passwordController.text);
      print("confirmpassword  " + confirmPasswordController.text);
      setState(() {
        if (passwordController.text != confirmPasswordController.text) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('password not match')));
          confirmPasswordController.text;
        } else {
          print('result');
          save();
          // Navigator.pushNamed(context, MyRoutes.loginRoute);
        }
        // Navigator.pushNamed(context, MyRoutes.loginRoute);
      });
    } else {
      print("not valid");
    }
  }

  // Future<void> save() async {
  //   dynamic id = await SessionManager().get("userId");
  //   print(id);
  //   print("id");
  //   // ignore: unnecessary_null_comparison
  //   if (passwordController.text != null &&
  //       confirmPasswordController.text != null) {
  //     var response = await http.post(
  //         Uri.parse(Url.url + "/customer/passwordupdate/{$id}"),
  //         headers: {
  //           "token":
  //               "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
  //         },
  //         body: {
  //           "password": passwordController.text,
  //           // "confirm password": confirmPasswordController.text
  //         });
  //     print(response.body);
  //     print(response.statusCode);
  //     print("save");
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('Password Updated Successfully')));
  //       //  Navigator.pushNamed(context, MyRoutes.loginRoute);
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text('Password updation failed')));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('blank field not allowed')));
  //   }
  // }

  Future<void> save() async {
    dynamic id = await SessionManager().get("userId");
    print(id);
    print(passwordController.text);
    if (passwordController.text != '' && confirmPasswordController.text != '') {
      // print(Url.url + "/login/customer");
      var response = await http
          .put(Uri.parse(Url.url + "/customer/passwordupdate/{$id}"), body: {
        "password": passwordController.text,
        // "confirm password": confirmPasswordController.text
      }, headers: {
        "token": "Bearer hjskdhskjdhsjkdhskjdhskjdhskdhskjdhsdjksjhdsjkdsdks"
      });
      print(response.statusCode);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Updated Successfully')));
            Navigator.pushNamed(context, MyRoutes.loginRoute);
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
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Container(

                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
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
                                // PasswordInput(
                                //   icon: CupertinoIcons.lock_fill,
                                //   hint: "Reset password",
                                //   inputType: TextInputType.emailAddress,
                                //   inputAction: TextInputAction.done,
                                //   passwordController: passwordController,
                                // ),
                                PasswordInputValue(
                              icon: CupertinoIcons.lock_fill,
                              hint: "Add new password",
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                              passwordController: passwordController,
                            ),
                            PasswordInputValue(
                              icon: CupertinoIcons.lock_fill,
                              hint: "Confirm password",
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                              passwordController: confirmPasswordController,
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
                                        // save();
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
// class PasswordInput extends StatelessWidget {
//   const PasswordInput(
//       {Key? key,
//         required this.icon,
//         required this.hint,
//         required this.inputType,
//         required this.inputAction,
//         required this.passwordController})
//       : super(key: key);

//   final IconData icon;
//   final String hint;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final TextEditingController passwordController;

//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child:
//           Container(
//             child: TextFormField(
//               decoration: InputDecoration(
//                 // enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: Colors.black26,width: 1.0),),
//                 // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 1.0)),
//                 border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 0.75),borderRadius: BorderRadius.circular(30.0) ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 4),
//                 hintText: hint,

//                 prefixIcon: Padding(  padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Icon(     icon,  color: Colors.black26,size: 20, ),   ),
//                 hintStyle: headingText,
//               ),
//               controller: passwordController,
//               keyboardType: inputType,
//               textInputAction: inputAction,
//               obscureText: true,
//               style: headingText,
//               validator: MultiValidator([
//                 RequiredValidator(errorText: "Required"),
//                 MinLengthValidator(6, errorText: "Atleast 6 char required.")
//               ]),
//             ),
//           ));
//   }
// }
