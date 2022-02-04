
import 'package:demoapp/pages/drawer/profile/profile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() => runApp(const Drive());

class Drive extends StatelessWidget {
  const Drive({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: DriveLicense(title: appTitle),
    );
  }
}

class DriveLicense extends StatefulWidget {
  const DriveLicense({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DriveLicense> createState() => _DriveLicenseState();
}

class _DriveLicenseState extends State<DriveLicense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drive License', style: TextStyle(color:Colors.black, fontSize: 15),),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading:IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()))
                    },
                  ) ,
      elevation: 0,
      actions: [
            Builder(
              builder: (context) => IconButton(
                    icon:Image.asset('assets/images/Group 15214.png'),
                    onPressed: () => SlideDrawer.of(context)?.toggle(),
                  ),
            ),
          ],
          ),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children:[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Drive License', style: TextStyle(fontSize:20, ))),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Drive license number is needed if driver has registered a car. For bicycle it is not necessary',
                      style: TextStyle(fontSize:12),),
                    ),
                    Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('License Number', style: TextStyle(fontWeight:FontWeight.bold),)),
                  DottedBorder(
                    radius: Radius.circular(10),
                borderType: BorderType.RRect,
                    child: TextField(decoration: InputDecoration(        
              enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.transparent),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                   ),  
             ),),
                    ),
                ],
              ),
              
            ),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Image.asset('assets/images/upload icon.png'),
                Text('FRONT'),
                Image.asset('assets/images/delete icon.png')
              ]
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 60),
              child: DottedBorder(
                        borderType: BorderType.Circle,
                        child: Image.asset('assets/images/Photo camera.png'),
                        ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/upload icon.png'),
                  Text('BACK'),
                      Image.asset('assets/images/delete icon.png'),
                ],
              ),
              
              
            ),
            DottedLine(
  direction: Axis.horizontal,
  lineLength: double.infinity,
  lineThickness: 1.0,
  dashLength: 4.0,
  dashColor: Colors.black,
  dashRadius: 0.0,
  dashGapLength: 4.0,
  dashGapColor: Colors.transparent,
  dashGapRadius: 0.0,
),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 60),
              child: DottedBorder(
                        borderType: BorderType.Circle,
                        child: Image.asset('assets/images/Photo camera.png'),
                        ),
            ),
            // DottedBorder(child: BorderSide(color: Colors.black),)
                  ]
                ),
                
              ),
              
      ),
    );
  }
}
    