// import 'package:demoapp/pages/Transport/transport.dart';
// import 'package:demoapp/pages/Wallet/paypal.dart';
// import 'package:demoapp/pages/Wallet/wallet.dart';
// import 'package:demoapp/pages/drawer/profile/profile.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:slide_drawer/slide_drawer.dart';



// class Paypaladdress extends StatelessWidget {
//   const Paypaladdress({Key? key}) : super(key: key);

//   static const appTitle = 'Drawer Demo';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: appTitle,
//       home: PaypaladdressScreen(title: appTitle),
//     );
//   }
// }

// class PaypaladdressScreen extends StatefulWidget {
//   const PaypaladdressScreen({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<PaypaladdressScreen> createState() => _PaypaladdressScreenState();
// }

// class _PaypaladdressScreenState extends State<PaypaladdressScreen> {
//   var size, height,width;
//     bool isChecked = false;

//   void checkboxCallBack(bool? checkboxState) {
//     setState(() {
//       isChecked = checkboxState ?? true;
      
//     });
//   }

//    void checkboxCallBack2(bool? checkboxState) {
//     setState(() {
//       isChecked = checkboxState ?? false;
      
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//     return Scaffold(
//       appBar: AppBar(title: Text('', style: TextStyle(color:Colors.black, fontSize: 15),),
//       backgroundColor: Colors.transparent,
//       centerTitle: true,
//       leading:IconButton(
//                     icon:Image.asset('assets/images/Layer 1.png'),
//                     onPressed: () => {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Paypal()))
//                     },
//                   ) ,
//       elevation: 0,
//       actions: [
//             Builder(
//               builder: (context) => IconButton(
//                     icon:Image.asset('assets/images/Group 15214.png'),
//                     onPressed: () => SlideDrawer.of(context)?.toggle(),
//                   ),
//             ),
//           ],
//           ),
//       body: 
//       SingleChildScrollView(
        
//         child: Column(
//           children:[
            
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: Image.asset('assets/images/big paypal icon.png'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: Text('Add PayPal Address', style: TextStyle(fontSize:20),),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: Text('Add your address or add new one. This need for delivery product.', textAlign: TextAlign.center, ),
//             ),
//                 ListTile(
//                   leading: Padding(
//                     padding: const EdgeInsets.fromLTRB(30, 8, 0, 0),
//                     child: Image.asset('assets/images/paypal icon.png'),
//                   ),
//       title: Text(
//         'paypal@mydomain.net',
//       ),
//       trailing: TaskCheckbox(isChecked, checkboxCallBack),
//     ),
//     ListTile(
//       leading: Padding(
//         padding: const EdgeInsets.only(left: 30, top: 8),
//         child: Image.asset('assets/images/paypal icon.png'),
//       ),
//       title: Text(
//         'sales@gridgum.com',
//       ),
//       trailing: TaskCheckbox(!isChecked, checkboxCallBack2),
//     ),
//     Padding(
//       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//       child: DottedBorder(child: Padding(
//         padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//         child: TextField(decoration: InputDecoration(hintText: 'Add a new Paypal Email Address',
//         hintStyle:TextStyle(color: Colors.grey),
//         enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),),
//         focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                   ),),),
//       ),
      
//       borderType: BorderType.RRect,
//       radius: Radius.circular(30),
//       ),
//     ),
//   //   TextField(
// 	// autocorrect: true,
// 	// decoration: InputDecoration(
// 	//   hintText: 'Password',
// 	//   hintStyle: TextStyle(color: Colors.grey),
// 	//   filled: true,
// 	//   fillColor: Colors.white70,
// 	//   enabledBorder: OutlineInputBorder(
// 	// 	borderRadius: BorderRadius.all(Radius.circular(35.0)),
// 	// 	borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
// 	//    ),
// 	//   focusedBorder: OutlineInputBorder(
// 	// 	borderRadius: BorderRadius.all(Radius.circular(35.0)),
// 	// 	borderSide: BorderSide(color: Color(0xFFdadada), width: 2),
// 	//   ),
// 	// ),),
//     Padding(
//               padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius:BorderRadius.circular(30),
//                           color:Color(0xFFf4b705)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left:80),
//                           child: Row(
//                             children: [
//                               Text('SAVE NEW ADDRESS', style: TextStyle(color:Colors.black),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left:35),
//                                 child: Container(
//                                   alignment: Alignment.bottomRight,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color:Color(0xFFf4b705)),
//                           borderRadius:BorderRadius.circular(30),
//                           color:Colors.white
//                           ),
//                                   child: Image.asset('assets/images/Group 6184.png', height: 48,width: 48,)),
//                               )
//                             ],
//                           ),
//                         ),
                        
//                         ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
  
//           ]
//         ),
//       ),
      
//       endDrawer: Drawer(
//               child: Container(
//             decoration: BoxDecoration(
//               color: Color(0xFFef6b02)
//             ),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//       DrawerHeader(
//         child:Stack(
            
//             children:<Widget>[
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 15, 5),
//                     child: Row(
//                       children: [
//                         Image.asset(
//                                       'assets/images/CustomerAvatar.png',
//                                       height: 50,
//                                       width: 50,
//                                     ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 120),
//                           child: Image.asset(
//                                         'assets/images/Close Icon.png',
//                                         height: 20,
//                                         width: 20,
//                                       ),
//                         ),
//                         TextButton(
//             child: Text("Close",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => Navigator.pop(context)
//           )
//                       ],
//                     ),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 130),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Shipper', style:TextStyle(color: Colors.white),),
//                   Text('George Backer', style:TextStyle(color: Colors.white, fontSize: 15),),
//                   Text('0000000000', style:TextStyle(color: Colors.white))
//                   ],
//                   ),
//                 ),
//                 ],
//               )
//             ]
//         )
//       ),
        
//       Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/user.png',
//                 height:20,width:20, ),
//                 TextButton(
//             child: Text("Driver Profile",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {
//                 Navigator.push(
//     context,
//     MaterialPageRoute(
//     	builder: (context) => Profile()),
//                         )
//               }
//     //          
//           ),
//               ],
//             ),
//           ),
//       Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/4939949.png',
//                 height:20,width:20, color: Colors.white, ),
//                 TextButton(
//             child: Text("Transport",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {
//                           Navigator.push(
//     context,
//     MaterialPageRoute(
//     	builder: (context) => Transport()),)
//               }
    
                        
//           ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/white.png',
//                 height:20,width:20, ),
//                 TextButton(
//             child: Text("Delivery History",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {}
//     //           Navigator.push(
//     // context,
//     // MaterialPageRoute(
//     // 	builder: (context) => Menu()),
//     //                     )
//           ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 15),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/payment.png',
//                 height:30,width:30, ),
//                 TextButton(
//             child: Text("My Wallet",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {
//                 Navigator.push(
//     context,
//     MaterialPageRoute(
//     	builder: (context) => Wallet()),
//                         )
//               }
              
//           ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/notification-3134440-2639007-removebg-preview.png',
//                 height:20,width:20, ),
//                 TextButton(
//             child: Text("Notifications",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {}
//     //           Navigator.push(
//     // context,
//     // MaterialPageRoute(
//     // 	builder: (context) => Menu()),
//     //                     )
//           ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/setting.png',
//                 height:20,width:20, ),
//                 TextButton(
//             child: Text("Settings",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {}
//     //           Navigator.push(
//     // context,
//     // MaterialPageRoute(
//     // 	builder: (context) => Menu()),
//     //                     )
//           ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/support.png',
//                 height:20,width:20, ),
//                 TextButton(
//             child: Text("Support",style: TextStyle(color:Colors.white)),
            
//               onPressed: () => {}
//     //           Navigator.push(
//     // context,
//     // MaterialPageRoute(
//     // 	builder: (context) => Menu()),
//     //                     )
//           ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 70, 0, 0),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/Combined Shape.png',
//                 height:20,width:20, ),
//                 TextButton(
//             child: Text("Logout",style: TextStyle(color:Colors.white)),
            
//               onPressed: () async{
//                 // await AlertDialogs.yesCancelDialog(context, 'Logout', 'Want to Logout ?');
//               },
//           ),
//               ],
//             ),
//           ),
//               ],
              
//             ),
//             ],
//       ),
//           ),
//       ),
//     );
//   }
// }

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function(bool?) toggleCheckboxState;

//   TaskCheckbox(this.checkboxState, this.toggleCheckboxState);

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkboxState,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }