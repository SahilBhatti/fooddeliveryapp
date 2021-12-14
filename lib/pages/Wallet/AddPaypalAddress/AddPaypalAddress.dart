import 'dart:ui';
import 'package:demoapp/constants/constants.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';


class AddPaypalAddress extends StatefulWidget {
  const AddPaypalAddress({Key? key}) : super(key: key);
  @override
  _AddPaypalAddressState createState() => _AddPaypalAddressState();
}

class _AddPaypalAddressState extends State<AddPaypalAddress> {
  var _result;
  TextEditingController usernameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("", style: TextStyle(color:Colors.black),),
        leading: IconButton(
          color:Colors.black,
                    icon:Icon(Icons.arrow_back_ios),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
                                        },
                  ) ,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: Image.asset('assets/images/big paypal icon.png'),
              ),
              Text('Add PayPal Address',style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Text('Add your address or add new one.this need for delivery product',
                textAlign: TextAlign.center,),
              ),
                    Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:30,right: 10,top: 5),
                child: Image.asset('assets/images/paypal icon.png'),
              ),
              Text('paypal@demain.net'),
              Padding(
                padding: const EdgeInsets.only(left:90),
                child: Radio(
                  activeColor: Colors.orange,
                          value: 0,
                          groupValue: _result,
                          onChanged: (value) {
                            setState(() {
                              _result = value;
                            });
                          }),
              ),
            ],
          ),

                  Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:30,right: 10,top: 5),
                child: Image.asset('assets/images/paypal icon.png'),
              ),
              Text('sales@gridgum.com'),
              Padding(
                padding: const EdgeInsets.only(left:85),
                child: Radio(
                  activeColor: Colors.orange,
                          value: 1,
                          groupValue: _result,
                          onChanged: (value) {
                            setState(() {
                              _result = value;
                            });
                          }),
              ),
            ],
          ),

              Padding(
                  padding:  EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child:   Form(child:   UsernameInput(
                    key: formKey,
                    icon: CupertinoIcons.add,
                    hint: "Save new Address",
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
                              // Navigator.pop(context);
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
