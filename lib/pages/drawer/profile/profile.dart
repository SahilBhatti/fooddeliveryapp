import 'package:demoapp/pages/change_password/Change_Password.dart';
import 'package:demoapp/pages/driver_license/driver_license.dart';
import 'package:demoapp/pages/personal_information/personal_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color:Colors.black),
        ),
        leading: IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
                                        },
                  ) ,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child:GestureDetector(
  onTap: () {}, // handle your image tap here
  child: Image.asset(
    'assets/images/Customer avatarfgfd.png',
    fit: BoxFit.cover, // this is the solution for border
    width: 110.0,
    height: 110.0,
  ),
)
            ),
            Text('Name, Last name'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              child: DottedBorder(
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(leading: Image.asset('assets/images/target.png'),
              title: Text('Personal Information'),
              trailing: Image.asset('assets/images/arrow left.png'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonalInformation(title: 'title')));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(leading: Image.asset('assets/images/Fill177.png'),
              title: Text('Drive License'),
              trailing: Image.asset('assets/images/arrow left.png'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Drive()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(leading: Image.asset('assets/images/lock.png'),
              title: Text('Change Password'),
              trailing: Image.asset('assets/images/arrow left.png'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
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

