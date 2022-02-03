import 'package:demoapp/pages/Transport/Bike.dart';
import 'package:demoapp/pages/Transport/car.dart';
import 'package:demoapp/pages/Transport/motorcycle.dart';
import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({Key? key}) : super(key: key);

  @override
  _TransportState createState() => _TransportState();
}

class _TransportState extends State<Transport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/Layer 1.png'),
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home(email: '',name: '',userProfile: '',)))
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/Customer avatar.png',
                height: 120,
                width: 120,
              ),
            ),
            Text(
              'Transport Registration',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Text(
                'Add your address or add new one. This need for delivery product',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: DottedBorder(
                  radius: Radius.circular(5),
                  borderType: BorderType.RRect,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/377-3775851_png-file-svg-bike-symbol-clipart.png',
                      height: 20,
                      width: 20,
                    ),
                    title: Text('Bike'),
                    trailing: Image.asset('assets/images/arrow left.png'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bike()));
                    },
                    // trailing: Image.asset('assets/images/Path 24317.png'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                  radius: Radius.circular(5),
                  borderType: BorderType.RRect,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/Motorcycle-icon.png',
                      height: 20,
                      width: 20,
                    ),
                    title: Text('Motorcycle'),
                    trailing: Image.asset('assets/images/arrow left.png'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Motorcycle()));
                    },
                    // trailing: Image.asset('assets/images/Path 24317.png'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                  radius: Radius.circular(5),
                  borderType: BorderType.RRect,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/car-line-black-icon-png_309315-removebg-preview.png',
                      height: 30,
                      width: 30,
                    ),
                    title: Text('Car'),
                    trailing: Image.asset('assets/images/arrow left.png'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Car()));
                    },
                    // trailing: Image.asset('assets/images/Path 24317.png'),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
