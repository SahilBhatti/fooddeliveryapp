import 'package:demoapp/pages/Transport/transport.dart';
import 'package:demoapp/pages/drawer/profile/profile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ChangedPassword());

class ChangedPassword extends StatelessWidget {
  const ChangedPassword({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: Password(title: appTitle),
    );
  }
}

class Password extends StatefulWidget {
  const Password({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Password> createState() => _PasswordState();
}

bool _passwordVisible=false;
bool _confirmpasswordVisible=false;
@override
  void initState() {
    _passwordVisible = false;
    _confirmpasswordVisible = false;
  }


class _PasswordState extends State<Password> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Change Password', style: TextStyle(color:Colors.black, fontSize: 15),),
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
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                  ),
            ),
          ],
          ),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:[
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/CustomerAvatar.png')),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('Change Password', style: TextStyle(fontSize:20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Text('Enter your new Password and then click on the saved button below.', textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: DottedBorder(
                  radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(
        title: Row(
          children:[
            Image.asset('assets/images/lock.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration.collapsed(hintText: 'Password')),
              ),
            ),
            IconButton(onPressed: (){
              setState(() {
                   _passwordVisible = !_passwordVisible;
               });
            }, 
            icon: Icon( _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,))
          ],
        ),
        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: DottedBorder(
                  radius: Radius.circular(10),
                borderType: BorderType.RRect,
                child: ListTile(
        title: Row(
          children:[
            Image.asset('assets/images/lock.png'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  obscureText: !_confirmpasswordVisible,
                  controller: confirmpasswordController,
                  decoration: InputDecoration.collapsed(hintText: 'Confirm Password')),
              ),
            ),
            IconButton(onPressed: (){
              setState(() {
                   _confirmpasswordVisible = !_confirmpasswordVisible;
               });
            }, 
            icon: Icon( _confirmpasswordVisible
               ? Icons.visibility
               : Icons.visibility_off,))
          ],
        ),
        ),
                ),
              ),
              Padding(
    padding: const EdgeInsets.only(top: 25),
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
	width: 300,
	child: TextButton(
    
    child: Text('SAVE', style: TextStyle(color:Colors.white),),
    style:
    ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(55, 20, 55, 20)),
      backgroundColor: MaterialStateProperty.all(Color(0xFFf66b00)),

      
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
      
      )
      
      
    )

    
    ),
    onPressed: () {},
    
),
    ),
    
  ),
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
    