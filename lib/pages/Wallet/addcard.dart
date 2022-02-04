
import 'package:demoapp/pages/Wallet/bankdetails.dart';
import 'package:demoapp/pages/Wallet/creditcard.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() => runApp(const Addcard());

class Addcard extends StatelessWidget {
  const Addcard({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: AddcardScreen(title: appTitle),
    );
  }
}

class AddcardScreen extends StatefulWidget {
  const AddcardScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AddcardScreen> createState() => _AddcardScreenState();
}

class _AddcardScreenState extends State<AddcardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/Layer 1.png'),
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Creditcard()))
          },
        ),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Image.asset('assets/images/Group 15214.png'),
              onPressed: () => SlideDrawer.of(context)?.toggle(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Text('Add New Card Info'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: DottedBorder(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 50),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: Image.asset(
                    'assets/images/png-transparent-logo-mastercard-font-solar-home-text-orange-logo-removebg-preview.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, top: 30),
                  child: Image.asset('assets/images/Group 6201.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 40, 30),
                  child: Text('Scan your card'),
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Form(
                //  key: formKey,
                child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Card number",
                          labelStyle: headingText,
                          // fillColor: Colors.red,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black45, width: 1),
                          ),
                          alignLabelWithHint: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black45,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: "Valid Thru",
                                labelStyle: headingText,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black45, width: 1),
                                ),
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black45, width: 1),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        new Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 5),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: "Enter Cvv",
                              // keyboardType: TextInputType.number,
                              // textInputAction: inputAction,
                              labelStyle: headingText,
                              // fillColor: Colors.red,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black45, width: 1),
                              ),
                              alignLabelWithHint: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black45, width: 1),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                    Container(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Enter card holder name",
                          labelStyle: headingText,
                          // fillColor: Colors.red,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black45, width: 1),
                          ),
                          alignLabelWithHint: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black45, width: 1),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, elevation: 0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bankdetails()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF265395)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 20),
                    child: Text(
                      'SAVE CARD',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
