import 'package:country_code_picker/country_code_picker.dart';
import 'package:demoapp/pages/Transport/transport.dart';
import 'package:demoapp/pages/drawer/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: PersonalInformation(title: appTitle),
    );
  }
}

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Information', style: TextStyle(color:Colors.black, fontSize: 15),),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading:IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.of(context).pop(true)
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
              child: Column(
          children: [
            Image.asset('assets/images/Customer avatarfgfd.png',height: 80,width: 80,),
            Text('Name, Last name', style: TextStyle(fontSize:20),),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Text('Enter your new password and then click on the Save button below.', textAlign: TextAlign.center,),
            ),
            Padding(
  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
child:Row(
                    children: <Widget>[
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  
                                  prefixIcon: Container(
                                    child: CountryCodePicker(
                                    
              onChanged: print,
              initialSelection: 'US',
              favorite: ['+44'],
              showCountryOnly: false,
              flagDecoration: BoxDecoration(borderRadius:BorderRadius.circular(10)),
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              
            ),
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
  		borderRadius: BorderRadius.all(Radius.circular(40.0)),
  		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
  	   ),
  	  focusedBorder: OutlineInputBorder(
  		borderRadius: BorderRadius.all(Radius.circular(40.0)),
  		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
  	  ),
                                  hintText: "Phone Number",
                                ),
                                onChanged: (value) {
                                  // this.phoneNo=value;
                                  print(value);
                                },
                              ),
                            ),
                          ],
                        ),
    ),
    Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Container(
	child: TextField(
	autocorrect: true,
	decoration: InputDecoration(
	  hintText: 'Name Last name',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('assets/images/Path 24126.png',height: 10,width: 10,),
          // child: Image.asset('/assets/images/Path 24126.png')
        ),
	  hintStyle: TextStyle(color: Colors.grey),
	  filled: true,
	  fillColor: Colors.white70,
	  enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(40.0)),
		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
	   ),
	  focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(40.0)),
		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
	  ),
	),)
  ),
    ),
    Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Container(
	child: TextField(
	autocorrect: true,
	decoration: InputDecoration(
	  hintText: 'Email address',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('assets/images/message_1_.png', height: 10,width: 10,),
          // child: Image.asset('/assets/images/Path 24126.png')
        ),
	  hintStyle: TextStyle(color: Colors.grey),
	  filled: true,
	  fillColor: Colors.white70,
	  enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(40.0)),
		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
	   ),
	  focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(40.0)),
		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
	  ),
	),)
  ),
    ),
    Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Container(
	child: TextField(
	autocorrect: true,
	decoration: InputDecoration(
	  hintText: 'Personal ID',
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset('assets/images/Path 24317.png', height: 10,width: 10,),
          // child: Image.asset('/assets/images/Path 24126.png')
        ),
	  hintStyle: TextStyle(color: Colors.grey),
	  filled: true,
	  fillColor: Colors.white70,
	  enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(40.0)),
		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
	   ),
	  focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(40.0)),
		borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
	  ),
	),)
  ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
	width: 320,
	child: TextButton(
    
    child: Text('SAVE', style: TextStyle(color:Colors.black),),
    style:
    ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(55, 20, 55, 20)),
      backgroundColor: MaterialStateProperty.all(Color(0xFFf66b00),),

      
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
      
      )
      
      
    )

    
    ),
    onPressed: () {},
    
),
    ),
    
  ),
          ],
          
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
    //       endDrawer: Drawer(
        
    
    //     ),
    