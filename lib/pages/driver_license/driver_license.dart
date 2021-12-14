import 'package:demoapp/pages/Transport/transport.dart';
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
      
      endDrawer: Drawer(
              child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFef6b02)
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
      DrawerHeader(
        child:Stack(
            
            children:<Widget>[
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
            child: Text("Close",style: TextStyle(color:Colors.white)),
            
              onPressed: () => Navigator.pop(context)
          )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shipper', style:TextStyle(color: Colors.white),),
                  Text('George Backer', style:TextStyle(color: Colors.white, fontSize: 15),),
                  Text('0000000000', style:TextStyle(color: Colors.white))
                  ],
                  ),
                ),
                ],
              )
            ]
        )
      ),
        
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset('assets/images/user.png',
                height:20,width:20, ),
                TextButton(
            child: Text("Driver Profile",style: TextStyle(color:Colors.white)),
            
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
                Image.asset('assets/images/4939949.png',
                height:20,width:20, color: Colors.white, ),
                TextButton(
            child: Text("Transport",style: TextStyle(color:Colors.white)),
            
              onPressed: () => {
                          Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => Transport()),)
              }
    
                        
          ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.asset('assets/images/745133.png',
                height:20,width:20, ),
                TextButton(
            child: Text("Delivery History",style: TextStyle(color:Colors.white)),
            
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
                Image.asset('assets/images/payment.png',
                height:30,width:30, ),
                TextButton(
            child: Text("My Wallet",style: TextStyle(color:Colors.white)),
            
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
                Image.asset('assets/images/notification-3134440-2639007-removebg-preview.png',
                height:20,width:20, ),
                TextButton(
            child: Text("Notifications",style: TextStyle(color:Colors.white)),
            
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
                Image.asset('assets/images/setting.png',
                height:20,width:20, ),
                TextButton(
            child: Text("Settings",style: TextStyle(color:Colors.white)),
            
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
                Image.asset('assets/images/support.png',
                height:20,width:20, ),
                TextButton(
            child: Text("Support",style: TextStyle(color:Colors.white)),
            
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
                Image.asset('assets/images/Combined Shape.png',
                height:20,width:20, ),
                TextButton(
            child: Text("Logout",style: TextStyle(color:Colors.white)),
            
              onPressed: () async{
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
    