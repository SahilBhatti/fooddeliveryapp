import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() => runApp(Settings());

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color:Colors.black),),
        leading: IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
                                        },
                  ) ,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
              child: Text('General Settings', style: TextStyle(fontSize:20),),
            )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: Row(
              children: [
                Text('I agree to share my location'),
                Padding(
                  padding: const EdgeInsets.only(left:60,bottom: 10),
                  child: FlutterSwitch(
                    activeToggleColor: Colors.white,
                    inactiveToggleColor: Colors.white,
                    activeTextColor: Colors.transparent,
                    inactiveTextColor: Colors.transparent,
                    width: 45.0,
                    height: 25.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 1.0,
                    activeColor: Colors.orange,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: DottedLine(dashColor: Colors.grey,),
          ),
          Align(
            alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:25),
                        child: TextButton(
              onPressed: (){},
              child: Text('Terms of Use', style: TextStyle(color:Colors.black),)),
                      ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: DottedLine(dashColor: Colors.grey,),
          ),
          Align(
            alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:25),
                        child: TextButton(
              onPressed: (){},
              child: Text('Privacy Policy',style: TextStyle(color:Colors.black))),
                      ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: DottedLine(dashColor: Colors.grey,),
          ),
        ],
      ),
    );
  }
}