// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:demoapp/pages/user/Login.dart';
// import 'package:demoapp/utlis/platte.dart';
// import 'package:demoapp/utlis/routes.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:hexcolor/hexcolor.dart';

// class Signup extends StatefulWidget {
//   const Signup({Key? key}) : super(key: key);

//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   bool agree = false;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   var formKey = GlobalKey<FormState>();

//   validateData() async {
//     final isValid = formKey.currentState!.validate();



//     if (isValid) {
//       formKey.currentState?.save();
//       print("email  " + emailController.text);
//       print("password  " + passwordController.text);
//       setState(() {
//         Navigator.pushNamed(context, MyRoutes.otpVerify);
//     });

//     } else {
//       print("not valid");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Column(
//           children: [
//               Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.35,
//                     child:    Padding(
//                       padding: EdgeInsets.all(10),
//                       child:   Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage( 'assets/images/hd_logo.png') ),),

//                       ),
//                     )
//                 ),
//               ],
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.60,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
//                 child:
//                 Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             UsernameInput(
//                               icon: CupertinoIcons.profile_circled,
//                               hint: "Username",
//                               inputType: TextInputType.name,
//                               inputAction: TextInputAction.next,
//                               userNameController: usernameController,
//                             ),

//                             MobileInput(
//                               icon: CupertinoIcons.phone,
//                               hint: "0000-0000-0000",
//                               inputType: TextInputType.number,
//                               inputAction: TextInputAction.next,
//                               mobileController: mobileController,
//                             ),

//                             EmailTextInput(
//                               icon: CupertinoIcons.envelope_fill,
//                               hint: "Email",
//                               inputType: TextInputType.emailAddress,
//                               inputAction: TextInputAction.next,
//                               emailController: emailController,
//                             ),
//                             PasswordInputValue(
//                               icon: CupertinoIcons.lock_fill,
//                               hint: "Password",
//                               inputType: TextInputType.emailAddress,
//                               inputAction: TextInputAction.done,
//                               passwordController: passwordController,
//                             ),
//                             Container(
//                                 margin: const EdgeInsets.only(top: 10),
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     primary: HexColor(orange),
//                                     padding: EdgeInsets.symmetric(
//                                         vertical: 10.0, horizontal: 5.0),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30.0)),
//                                     elevation: 8.0,
//                                     minimumSize: Size(double.infinity,
//                                         44), // double.infinity is the width and 30 is the height
//                                   ),
//                                   onPressed: () {
//                                     validateData();
//                                     // Navigator.push(
//                                     //     context,
//                                     //     MaterialPageRoute(
//                                     //         builder: (context) =>
//                                     //             OtpVerification()));
//                                   },
//                                   child: Text("Signup".toUpperCase(),
//                                       style: btnWhiteText),
//                                 )),

//                             Padding(
//                               padding: EdgeInsets.only(top: 20),
//                               child: Text.rich(TextSpan(text: "Already have account ?",
//                                   style: headingText,
//                                   children: <InlineSpan>[
//                                     TextSpan(
//                                         text: " Login",
//                                         style: TextStyle(
//                                           decoration: TextDecoration.underline,
//                                           fontSize: 14,
//                                           fontFamily: "Roboto",
//                                           color: HexColor(orange),
//                                         ),
//                                         recognizer: new TapGestureRecognizer()
//                                           ..onTap = () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) => Login()));
//                                           })
//                                   ])),
//                             )

//                           ],
//                         ),
//                       ],
//                     )),
//               ),
//             ),
//             Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.10,
//                 child: Align(
//                   // child:
//                   // Container(
//                   //     decoration: BoxDecoration(
//                   //         border: Border(
//                   //             bottom:
//                   //                 BorderSide(color: Colors.white, width: 1))),
//                   //     child: Padding(
//                   //       padding: EdgeInsets.only(bottom: 30),
//                   //       child: Text.rich(TextSpan(
//                   //           text: "Already have account ?",
//                   //           style: verySmallText,
//                   //           children: <InlineSpan>[
//                   //             TextSpan(
//                   //                 text: " Login",
//                   //                 style: TextStyle(
//                   //                   decoration: TextDecoration.underline,
//                   //                   fontSize: 14,
//                   //                   fontFamily: "Roboto",
//                   //                   color: HexColor(orange),
//                   //                 ),
//                   //                 recognizer: new TapGestureRecognizer()
//                   //                   ..onTap = () {
//                   //                     Navigator.push(
//                   //                         context,
//                   //                         MaterialPageRoute(
//                   //                             builder: (context) => Login()));
//                   //                   })
//                   //           ])),
//                   //     )),
//                 )
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

// class UsernameInput extends StatelessWidget {
//   const UsernameInput(
//       {Key? key,
//       required this.icon,
//       required this.hint,
//       required this.inputType,
//       required this.inputAction,
//       required this.userNameController})
//       : super(key: key);

//   final IconData icon;
//   final String hint;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final TextEditingController userNameController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Container(
//           // decoration: BoxDecoration(
//           //     color: Colors.grey[600]!.withOpacity(0.5),
//           //     borderRadius: BorderRadius.circular(10)),
//           child: TextFormField(
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black26, width: 0.75),
//                     borderRadius: BorderRadius.circular(30.0)),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 4),
//                 hintText: hint,
//                 prefixIcon: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Icon(
//                       icon,
//                       color: Colors.black26,
//                       size: 20,
//                     )),
//                 hintStyle: headingText),
//             keyboardType: inputType,
//             textInputAction: inputAction,
//             style: headingText,
//             controller: userNameController,
//             validator: RequiredValidator(errorText: "Required"),
//           ),
//         ));
//   }
// }

// class MobileInput extends StatelessWidget {
//   const MobileInput(
//       {Key? key,
//       required this.icon,
//       required this.hint,
//       required this.inputType,
//       required this.inputAction,
//       required this.mobileController})
//       : super(key: key);

//   final IconData icon;
//   final String hint;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final TextEditingController mobileController;

//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child:GestureDetector(
//           child: Stack(
//             children: [
//               Container(child:
//                 TextFormField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black26, width: 0.75),
//                       borderRadius: BorderRadius.circular(30.0)),
//                   contentPadding: const EdgeInsets.symmetric(vertical: 4),
//                   hintText: hint,
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 54.0),
//                     // child: Icon(  icon,  color: Colors.black26,size: 20,)
//                   ),
//                 ),
//                 keyboardType: TextInputType.number,
//                 textInputAction: inputAction,
//                 style: headingText,
//                 controller: mobileController,
//                 validator: RequiredValidator(errorText: "Required"),
//               ),
//               ),
//               SizedBox(
//               width: 140,
//               child:
//               CountryCodePicker(
//                 onChanged: print,
//                 initialSelection: 'IT',
//                 favorite: ['+39','FR'],
//                 showCountryOnly: false,
//                 showOnlyCountryWhenClosed: false,
//                 alignLeft: true,
//                 flagWidth: 20,
//                 textStyle: headingText,
//                 dialogTextStyle: headingText,
//               ),
//             )
//             ],
//           ),
//         )

//     );
//   }
// }

// class EmailTextInput extends StatelessWidget {
//   const EmailTextInput(
//       {Key? key,
//       required this.icon,
//       required this.hint,
//       required this.inputType,
//       required this.inputAction,
//       required this.emailController})
//       : super(key: key);

//   final IconData icon;
//   final String hint;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final TextEditingController emailController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child:
//         Container(
//           // decoration: BoxDecoration(color: Colors.grey[600]!.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
//           child: TextFormField(
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black26, width: 0.75),
//                     borderRadius: BorderRadius.circular(30.0)),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 4),
//                 hintText: hint,
//                 prefixIcon: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Icon(
//                       icon,
//                       color: Colors.black26,
//                       size: 20,
//                     )),
//                 hintStyle: headingText),
//             keyboardType: inputType,
//             textInputAction: inputAction,
//             style: headingText,
//             controller: emailController,
//             validator: MultiValidator([
//               RequiredValidator(errorText: "Required"),
//               EmailValidator(errorText: "Enter valid email.")
//             ]),
//           ),
//         )
//     );
//   }
// }

// class PasswordInputValue extends StatefulWidget {

//   const PasswordInputValue(
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
//   _PasswordInputValueState createState() => _PasswordInputValueState(icon,hint,inputType,inputAction,passwordController );
// }

// class _PasswordInputValueState extends State<PasswordInputValue> {
//   final IconData icon;
//   final String hint;
//   final TextInputType inputType;
//   final TextInputAction inputAction;
//   final TextEditingController passwordController;
//   bool _isObscure = true;

//   _PasswordInputValueState(this.icon, this.hint, this.inputType, this.inputAction, this.passwordController);

//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child:
//           Container(
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black26,width: 0.75),borderRadius: BorderRadius.circular(30.0) ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 4),
//                 hintText: hint,

//                 suffixIcon: IconButton(
//                     icon: Icon(
//                         _isObscure ? Icons.visibility : Icons.visibility_off),
//                     onPressed: () {
//                       setState(() {
//                         _isObscure = !_isObscure;
//                       });

//                     }),

//                 prefixIcon: Padding(  padding: const EdgeInsets.symmetric(horizontal: 8),
//                   child: Icon( icon,  color: Colors.black26,size: 20, ),   ),
//                 hintStyle: headingText,
//               ),

//               controller: passwordController,
//               keyboardType: inputType,
//               textInputAction: inputAction,
//               obscureText: _isObscure,
//               style: headingText,
//               validator: MultiValidator([
//                 RequiredValidator(errorText: "Required"),
//                 MinLengthValidator(6, errorText: "Atleast 6 char required.")
//               ]),
//             ),
//           ));
//   }
// }

