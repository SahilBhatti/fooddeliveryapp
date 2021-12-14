// import 'package:demoapp/pages/Account/account.dart';
// import 'package:demoapp/pages/Wallet/wallet.dart';
// import 'package:demoapp/pages/map/map1.dart';
// import 'package:demoapp/pages/profile/profile.dart';
// import 'package:flutter/material.dart';

// //import 'package:food_app/utlis/routes.dart';

// class Menu extends StatelessWidget {

//   const Menu({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
      
//       debugShowCheckedModeBanner: false,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   // static  TextStyle optionStyle =
//   //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static  List _widgetOptions = [

//     Container(
//       child: Profile()
//     ),
    
//     Container(
//       child: LicensePage()
//     ),
    
//     Container(
//       child: GetLocation()
      
//     ),
    
//     Container(
//       child: Wallet()
//     ),
    
//     Container(
//       child: Account()
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//   if (index == 0){

//   }
//   if(index == 1){

//   }
//   if(index == 2){

//   }
//   if(index == 3){

//   }
//   if(index == 4){

//   }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('BottomNavigationBar Sample'),
//       // ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar:  Container(
        
//         decoration: BoxDecoration(
          
//           color: Colors.white,
//           borderRadius:BorderRadius.only(
//             topRight: Radius.circular(30),
//         topLeft: Radius.circular(30),
        
//           )
//         ),
//         child: BottomNavigationBar(
          
          
//             items: const <BottomNavigationBarItem>[

//               BottomNavigationBarItem(
//         // backgroundColor: Colors.white,
//          icon: ImageIcon(AssetImage('assets/images/home-icon-free-11549922775iqxl34wxso.png')),
//         label: 'Home',
//               ),
              
//               BottomNavigationBarItem(
//         // backgroundColor: Colors.white,
//          icon: ImageIcon(AssetImage('assets/images/254-2547231_png-file-svg-fast-delivery-icon-png-clipart.png')),
//         label: 'Delivery',
//               ),
//               BottomNavigationBarItem(
//         // backgroundColor: Colors.white,
//          icon: ImageIcon(AssetImage('assets/images/803708a2135c22ec40826c306b00e933.png')),
        
//         label: 'Search',
//               ),
//                 BottomNavigationBarItem(
//         // backgroundColor: Colors.white,
//          icon: ImageIcon(AssetImage('assets/images/714-7147174_png-file-svg-transparent-background-shopping-cart-icon.png')),
        
//         label: 'Cart',
//               ),
//                 BottomNavigationBarItem(
//         // backgroundColor: Colors.white,
//         icon: ImageIcon(AssetImage('assets/images/account-269-866236.png')),
        
//         label: 'Account',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             showUnselectedLabels: true,
//             showSelectedLabels: true,
//             selectedLabelStyle: TextStyle(color:Colors.black, fontSize: 10),
//             unselectedLabelStyle: TextStyle(color:Colors.black,fontSize: 10),
//             selectedItemColor: Colors.black,
//             unselectedItemColor: Colors.black,
//            // unselectedItemColor: Colors.grey,
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.white10,
//             elevation: 0,
//             selectedFontSize: 0,
//             unselectedFontSize: 0,
//             iconSize: 26,
//             onTap: _onItemTapped,
//           ),
//       )
//     );
//   }
// }