import 'package:demoapp/pages/Transport/transport.dart';
import 'package:demoapp/pages/Wallet/bankdetails.dart';
import 'package:demoapp/pages/Wallet/creditcard.dart';
import 'package:demoapp/pages/Wallet/wallet.dart';
import 'package:demoapp/pages/drawer/profile/profile.dart';
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
      endDrawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFef6b02)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Stack(children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 5),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/CustomerAvatar.png',
                            height: 50,
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 120),
                            child: Image.asset(
                              'assets/images/Close Icon.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          TextButton(
                              child: Text("Close",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () => Navigator.pop(context))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 130),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipper',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'George Backer',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text('0000000000',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                )
              ])),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/user.png',
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                            child: Text("Driver Profile",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()),
                                  )
                                }
                            //
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/4939949.png',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                        TextButton(
                            child: Text("Transport",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Transport()),
                                  )
                                }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/white.png',
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                            child: Text("Delivery History",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {}
                            //           Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            // 	builder: (context) => Menu()),
                            //                     )
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/payment.png',
                          height: 30,
                          width: 30,
                        ),
                        TextButton(
                            child: Text("My Wallet",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Wallet()),
                                  )
                                }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/notification-3134440-2639007-removebg-preview.png',
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                            child: Text("Notifications",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {}
                            //           Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            // 	builder: (context) => Menu()),
                            //                     )
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/setting.png',
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                            child: Text("Settings",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {}
                            //           Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            // 	builder: (context) => Menu()),
                            //                     )
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/support.png',
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                            child: Text("Support",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () => {}
                            //           Navigator.push(
                            // context,
                            // MaterialPageRoute(
                            // 	builder: (context) => Menu()),
                            //                     )
                            ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 70, 0, 0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Combined Shape.png',
                          height: 20,
                          width: 20,
                        ),
                        TextButton(
                          child: Text("Logout",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            // await AlertDialogs.yesCancelDialog(context, 'Logout', 'Want to Logout ?');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
