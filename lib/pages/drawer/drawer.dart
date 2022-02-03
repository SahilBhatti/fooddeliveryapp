import 'package:demoapp/pages/Transport/transport.dart';
import 'package:demoapp/pages/Wallet/wallet.dart';
import 'package:demoapp/pages/drawer/deliver%20history/deliverhistory/deliverhistory.dart';
import 'package:demoapp/pages/drawer/logoutalert/logout.dart';
import 'package:demoapp/pages/drawer/notifications/notifications.dart';
import 'package:demoapp/pages/drawer/profile/profile.dart';
import 'package:demoapp/pages/drawer/settings/settings.dart';
import 'package:demoapp/pages/drawer/support/support.dart';
import 'package:demoapp/pages/map/map1.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:slide_drawer/slide_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.userProfile,required this.email,required this.name}) : super(key: key);
final String userProfile;
final String name;
final String email;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop() async {
    if (_scaffoldKey.currentState != null &&
        _scaffoldKey.currentState!.isEndDrawerOpen) {
      return true;
    }
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Leaving our App?'),
            content: new Text('Are you sure you want to Exit?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'.toUpperCase()),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Yes'.toUpperCase()),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Color(0xFFf66b00),
          key: _key,
          body: SlideDrawer(
            alignment: SlideDrawerAlignment.start,
            contentDrawer: Container(
              margin: EdgeInsets.only(top: 10),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading:
                            ImageIcon(AssetImage('assets/images/user.png')),
                        title: Text(
                          'Driver Profile',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Icon(
                          Icons.emoji_transportation,
                          color: Colors.white,
                          size: 24,
                        ),
                        title: Text(
                          'Transport',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Transport()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 24,
                        ),
                        title: Text(
                          'Deliver history',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderHistory()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Icon(
                          Icons.wallet_giftcard_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        title: Text(
                          'My Wallet',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wallet()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: ImageIcon(
                          AssetImage(
                              'assets/images/notification-3134440-2639007-removebg-preview.png'),
                          color: Colors.white,
                          size: 24,
                        ),
                        title: Text(
                          'Notifications',
                          style: btnWhiteText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 24,
                        ),
                        title: Text(
                          'Settings',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading:
                            ImageIcon(AssetImage('assets/images/support.png')),
                        title: Text(
                          'Support',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Support()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 24,
                        ),
                        title: Text(
                          'Logout',
                          style: btnWhiteNrmlText,
                        ),
                        onTap: () {
                          showDialog(
                    context: context,
                    builder: (_) => (Logout()),
                  );
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Login()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            rotateAngle: 3.14 / 6,
            offsetFromRight: 130.0,
            curve: Curves.easeInOutCirc,
            duration: Duration(milliseconds: 10),
            headDrawer: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                  widget.userProfile,
                ),),
                        Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              widget.name,
                              style: btnWhiteNrmlText,
                            )),
                            Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              widget.email,
                              style: btnWhiteNrmlText,
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(4.0, 0, 4, 4),
                            child: Text(
                              '+0987654321',
                              style: btnWhiteSmallText,
                            ))
                      ],
                    ),
                  )),
            ),
            backgroundColor: Color(0xFFf66b00),
            // onWillPop: () async {
            //   print("state is $_scaffoldKey.currentState!.isDrawerOpen");
            //   if (_key.currentState!.isDrawerOpen && _scaffoldKey.currentState!.isDrawerOpen) {
            //     return Future.value(true);
            //   }
            // else if (_hasOnWillPop) {
            //   return widget.onWillPop?.call();
            // } else {
            //   return Future.value(true);
            // }
            //},
            child: HomeData(),

            // child: HomePage(),
          ),
        ),
        onWillPop: _onWillPop);
  }
}

class HomeData extends StatefulWidget {
  const HomeData({Key? key}) : super(key: key);

  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  int _selectedIndex = 0;
  static List _widgetOptions = [
    Container(child: GetLocation()),
    Container(child: GetLocation()
        // child: Text('Schadule')
        ),
    Container(
      child: GetLocation()
        // child: Text('Account')

        ),
    // child: Text('Notification')

    Container(child: Profile()
        // child: Text('Earnings')

        ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        //  Navigator.push( context, MaterialPageRoute(builder:(context) =>  GetLocation()));
      } else if (index == 1) {
        //  Navigator.push( context, MaterialPageRoute(builder:(context) =>  Wallet()));
      } else if (index == 2) {
        //  Navigator.push( context, MaterialPageRoute(builder:(context) =>  Profile()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
                'assets/images/home-icon-free-11549922775iqxl34wxso.png')),
            label: 'Home',
            backgroundColor: Colors.white70,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
                'assets/images/254-2547231_png-file-svg-fast-delivery-icon-png-clipart.png')),
            label: 'Delivery',
            backgroundColor: Colors.white70,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/account-269-866236.png')),
            label: 'Account',
            backgroundColor: Colors.white70,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor(orange),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 26,
        elevation: 0,
        selectedLabelStyle: TextStyle(color: Colors.orange),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
