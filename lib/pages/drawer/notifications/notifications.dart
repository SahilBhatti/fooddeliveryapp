import "package:flutter/material.dart";
import 'package:flutter_switch/flutter_switch.dart';

void main() {
  runApp(new Notifications());
}

class Notifications extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool status= false;
  bool a = true;
  String mText = "Press to hide";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color:Colors.black),),
        leading: IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
                                        },
                  ) ,
        backgroundColor: Colors.white,
      ),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('turn on/off notifications'),
                    Padding(
                      padding: const EdgeInsets.only(right:20),
                      child: FlutterSwitch(
                            width: 60.0,
                            height: 25.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 1.0,
                            activeColor: Colors.red,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            }
                      ),
                    ),
                  ],
                ),
              ),

              
            ],
          )
      ),
    );
  }
}