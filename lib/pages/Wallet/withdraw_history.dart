import 'package:demoapp/pages/Transport/transport.dart';
import 'package:demoapp/pages/Wallet/wallet.dart';
import 'package:demoapp/pages/drawer/profile/profile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() => runApp(const Withdraw());

class Withdraw extends StatelessWidget {
  const Withdraw({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: WithdrawScreen(title: appTitle),
    );
  }
}

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Withdraw History', style: TextStyle(color:Colors.black, fontSize: 15),),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading:IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Wallet()))
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
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: DottedBorder(
                color:Color(0xFFe6e6e6),
                child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text('Total Withdraw/2019',),
                    )),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text('33,346.50 USD',style: TextStyle(fontSize:30),),
                    )),
                    Image.asset('assets/images/Line.png'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Text('01/15'),
                        Text('02/15'),
                        Text('03/21'),
                        Text('04/11'),
                        Text('05/11'),
                      ]
                    ),
                    SizedBox(
                      height:20
                    )
                ],
              ),
              radius: Radius.circular(20),
                  borderType: BorderType.RRect,
              ),
              
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                          child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 10, 0),
                    child: DottedBorder(
                      color:Color(0xFFe6e6e6),
                      child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 50, 0),
                            child: Text('Credit Card',style: TextStyle(fontSize:10),),
                          )),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                            child: Text(r'$3,977.00',style: TextStyle(fontSize:20),),
                          )),
                          Image.asset('assets/images/Line.png', height: 100,width: 140,),
                        
                          SizedBox(
                            height:20
                          )
                      ],
                    ),
                    radius: Radius.circular(20),
                    borderType: BorderType.RRect,),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),
                      color:Color(0xFFf66b00)),
                      child: DottedBorder(
                        color:Color(0xFFe6e6e6),
                        child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 60, 0),
                              child: Text('PayPal',style: TextStyle(fontSize:10),),
                            )),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                              child: Text(r'$3,977.00',style: TextStyle(fontSize:20),),
                            )),
                            Image.asset('assets/images/Graph.png', height: 100,width: 140,),
                          
                            SizedBox(
                              height:20
                            )
                        ],
                      ),
                      radius: Radius.circular(20),
                      borderType: BorderType.RRect,
                      ),
                    ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: DottedBorder(
                      color:Color(0xFFe6e6e6),
                      child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 50, 0),
                            child: Text('Master Card',style: TextStyle(fontSize:10),),
                          )),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                            child: Text(r'$3,977.00',style: TextStyle(fontSize:20),),
                          )),
                          Image.asset('assets/images/Line.png', height: 100,width: 140,),
                        
                          SizedBox(
                            height:20
                          )
                      ],
                    ),
                    radius: Radius.circular(20),
                    borderType: BorderType.RRect,
                    ),
                    
                  ),
                ],
              ),
            ),
            SizedBox(
              height:20
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Text('Transactions'),
                Text('View All')
              ]
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: ListTile(leading: Image.asset('assets/images/png-transparent-logo-mastercard-font-solar-home-text-orange-logo-removebg-preview.png', height: 50,width: 50,),
              title: Column(
                children: [
                  Text('15/04/2018'),
                  Text('Order #886402', style: TextStyle(fontSize:10),)
                ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(leading: Image.asset('assets/images/big paypal icon.png', height: 20,width: 20,),
              title: Column(
                  children: [
                    Text('15/04/2018'),
                    Text('Order #886402', style: TextStyle(fontSize:10),)
                  ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              ),
                )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: ListTile(leading: Image.asset('assets/images/ic_bank.png', height: 50,width: 50,),
              title: Column(
                children: [
                  Text('15/04/2018'),
                  Text('Order #886402', style: TextStyle(fontSize:10),)
                ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: ListTile(leading: Image.asset('assets/images/png-transparent-logo-mastercard-font-solar-home-text-orange-logo-removebg-preview.png', height: 50,width: 50,),
              title: Column(
                children: [
                  Text('15/04/2018'),
                  Text('Order #886402', style: TextStyle(fontSize:10),)
                ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(leading: Image.asset('assets/images/big paypal icon.png', height: 20,width: 20,),
              title: Column(
                  children: [
                    Text('15/04/2018'),
                    Text('Order #886402', style: TextStyle(fontSize:10),)
                  ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              ),
                )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(leading: Image.asset('assets/images/big paypal icon.png', height: 20,width: 20,),
              title: Column(
                  children: [
                    Text('15/04/2018'),
                    Text('Order #886402', style: TextStyle(fontSize:10),)
                  ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              ),
                )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: ListTile(leading: Image.asset('assets/images/ic_bank.png',height: 40,width: 40,),
              title: Column(
                children: [
                  Text('15/04/2018'),
                  Text('Order #886402', style: TextStyle(fontSize:10),)
                ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: DottedBorder(
                color: Color(0xFFe6e6e6),
                child: ListTile(leading: Image.asset('assets/images/ic_bank.png',height: 40,width: 40,),
              title: Column(
                children: [
                  Text('15/04/2018'),
                  Text('Order #886402', style: TextStyle(fontSize:10),)
                ],
              ),
              trailing: Text(r"$345.90", style:TextStyle(color: Color(0xFF00008B))),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangedPassword()));
              },
              // trailing: Image.asset('assets/images/Path 24317.png'),
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  color:Color(0xFF265395)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(110, 20, 110, 20),
                  child: Text('LOAD MORE', style: TextStyle(color:Colors.white),)
                )),
            )

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
                Image.asset('assets/images/white.png',
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
            
              onPressed: () => {
                Navigator.push(
    context,
    MaterialPageRoute(
    	builder: (context) => Wallet()),
                        )
              }
              
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