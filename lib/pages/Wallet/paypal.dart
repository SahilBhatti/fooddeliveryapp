// import 'package:demoapp/pages/Wallet/payment_methods.dart';
// import 'package:flutter/material.dart';
// import 'package:slide_drawer/slide_drawer.dart';



// class Paypal extends StatelessWidget {
//   const Paypal({Key? key}) : super(key: key);

//   static const appTitle = 'Drawer Demo';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: appTitle,
//       home: PaypalScreen(title: appTitle),
//     );
//   }
// }

// class PaypalScreen extends StatefulWidget {
//   const PaypalScreen({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<PaypalScreen> createState() => _PaypalScreenState();
// }

// class _PaypalScreenState extends State<PaypalScreen> {
//     bool isChecked = false;

//   void checkboxCallBack(bool? checkboxState) {
//     setState(() {
//       isChecked = checkboxState ?? true;
      
//     });
//   }

//    void checkboxCallBack2(bool? checkboxState) {
//     setState(() {
//       isChecked = checkboxState ?? false;
      
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('', style: TextStyle(color:Colors.black, fontSize: 15),),
//       backgroundColor: Colors.transparent,
//       centerTitle: true,
//       leading:IconButton(
//                     icon:Image.asset('assets/images/Layer 1.png'),
//                     onPressed: () => {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Paymentmethod()))
//                     },
//                   ) ,
//       elevation: 0,
//       actions: [
//             Builder(
//               builder: (context) => IconButton(
//                     icon:Image.asset('assets/images/Group 15214.png'),
//                     onPressed: () => SlideDrawer.of(context)?.toggle(),
//                   ),
//             ),
//           ],
//           ),
//       body: 
//       SingleChildScrollView(
//         child: Column(
//           children:[
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: Image.asset('assets/images/big paypal icon.png'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Text('Add PayPal Address', style: TextStyle(fontSize:20),),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: Text('Add your address or add new one. This need for delivery product.', textAlign: TextAlign.center, ),
//             ),
//                 ListTile(
//                   leading: Padding(
//                     padding: const EdgeInsets.fromLTRB(30, 8, 0, 0),
//                     child: Image.asset('assets/images/paypal icon.png'),
//                   ),
//       title: Text(
//         'paypal@mydomain.net',
//       ),
//       trailing: TaskCheckbox(isChecked, checkboxCallBack),
//     ),
//     ListTile(
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 30, top: 8),
//         child: Image.asset('assets/images/paypal icon.png'),
//       ),
//       title: Text(
//         'sales@gridgum.com',
//       ),
//       trailing: TaskCheckbox(!isChecked, checkboxCallBack2),
//     ),
//     Padding(
//               padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius:BorderRadius.circular(30),
//                           color:Color(0xFFf4b705)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:80),
//                           child: Row(
//                             children: [
//                               Text('SAVE NEW ADDRESS', style: TextStyle(color:Colors.black),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left:35),
//                                 child: Container(
//                                   alignment: Alignment.bottomRight,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color:Color(0xFFf4b705)),
//                           borderRadius:BorderRadius.circular(30),
//                           color:Colors.white
//                           ),
//                                   child: Image.asset('assets/images/Group 6184.png', height: 48,width: 48,)),
//                               )
//                             ],
//                           ),
//                         ),
                        
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//     Padding(
//               padding: const EdgeInsets.only(top: 0,bottom: 20,left: 10,right: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius:BorderRadius.circular(30),
//                   color:Color(0xFF265395)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(90, 15, 90, 15),
//                   child: Text('SAVE AS PRIMARY', style: TextStyle(color:Colors.white),)
//                 )),
//             )
  
//           ]
//         ),
//       ),
//     );
//   }
// }

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function(bool?) toggleCheckboxState;

//   TaskCheckbox(this.checkboxState, this.toggleCheckboxState);

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkboxState,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }




import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/pages/Wallet/addressModal/address.dart';
import 'package:demoapp/pages/Wallet/getaddress.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';


class Paypal extends StatefulWidget {
  const Paypal({Key? key}) : super(key: key);
  @override
  _PaypalState createState() => _PaypalState();
}

class _PaypalState extends State<Paypal> {
  TextEditingController usernameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          margin: EdgeInsets.only(top:10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:30),
                        child:  IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: 18.0,
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            }),
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text(
                    'Add Address',
                    style: boldheadingText,
                  )),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: Text(
                    'Add your address and personal details. This need for delivery product',
                    textAlign: TextAlign.center,
                    style: headingText,
                  )),
              Container(
                child: (AddressModel.deliveryAddress.isNotEmpty)
                    ? ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 0,
                          color: Colors.transparent,
                        ),
                    itemCount: AddressModel.deliveryAddress.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Addresses(
                            item: AddressModel.deliveryAddress[index]))
                    : CircularProgressIndicator(),
              ),


              Padding(
                  padding:  EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child:   Form(child:   UsernameInput(
                    key: formKey,
                    icon: CupertinoIcons.add,
                    hint: "Add new Address",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    userNameController: usernameController,
                  ),),

              ),
              Stack(
                children: [
                  Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: Stack(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor(orange),
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              elevation: 1,
                              minimumSize: Size(double.infinity,
                                  40), // double.infinity is the width and 30 is the height
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AddNewAddress()));
                            },
                            child: Text(
                              "Save new Address".toUpperCase(),
                              style: btnWhiteText,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: GestureDetector(
                                    onTap: () {
                                      },
                                    child: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                            border: Border.all(
                                                color: HexColor(Constants.orange),
                                                width: 1)),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                            color: Colors.white,
                                          ),
                                          child: Icon(
                                            Icons.clear_rounded,
                                            size: 20.0,
                                            color: Colors.black87,
                                          ),
                                        )),
                                  ))
                            ],
                          ),
                        ],
                      )),
                ],
              ),

            ],
          )),
    );
  }
}


class UsernameInput extends StatelessWidget {
  const UsernameInput(
      {Key? key,
        required this.icon,
        required this.hint,
        required this.inputType,
        required this.inputAction,
        required this.userNameController})
      : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController userNameController;

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
            controller: userNameController,
            validator: RequiredValidator(errorText: "Required"),
          ),
        ));
  }
}
