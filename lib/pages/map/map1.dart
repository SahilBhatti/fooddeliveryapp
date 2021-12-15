import 'package:demoapp/main.dart';
import 'package:demoapp/pages/map/accept/deliverydialog.dart';
import 'package:demoapp/pages/map/accept_decline.dart';
import 'package:demoapp/pages/map/decline/alertdialog.dart';
import 'package:demoapp/pages/map/lookingfororders.dart';
import 'package:demoapp/pages/newmap/index.dart';
import 'package:demoapp/utlis/platte.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slide_drawer/slide_drawer.dart';

const AndroidNotificationChannel channel=AndroidNotificationChannel(
  'high_importance_channel',
  'high_importance_notifications',importance: Importance.high,playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  Future <void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
    await Firebase.initializeApp();
    print('a big message just showing up:${message.messageId}');
  }

// Future <void> main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   runApp(GetLocation());

//   await flutterLocalNotificationsPlugin.
//   resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//   ?.createNotificationChannel(channel);

//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge:true,
//     sound: true
//   );
// }

class GetLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   primarySwatch: Colors.blue,
      // ),
      home: MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  bool changeColor = false;
  TimeOfDay endTime = TimeOfDay.now();
  bool status = false;
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController;
  late Position _currentPosition;
  String _currentAddress = '';
  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();
  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  Set<Marker> markers = {};
  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        // _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }
  // Method for calculating the distance between two places

  // Formula for calculating distance between two coordinates

  // Create the polylines for showing the route between two places

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      print("onMessage: $message");
      // RemoteNotification ?notification=message.notification;
      // AndroidNotification ?android=message.notification?.android;

      // if(notification!=null && android!=null){
      //   flutterLocalNotificationsPlugin.show(
      //     notification.hashCode, 
      //     notification.title, 
      //     notification.body,
      //     NotificationDetails(
      //       android:AndroidNotificationDetails(
      //         channel.id,
      //         channel.name,
      //         color: Colors.blue,
      //         playSound: true,
      //         icon: '@mipmap/ic_launcher'
      //       )
      //     ));
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      // print('a new message');
      print("onMessageOpenedApp: $message");
      if (message.data["navigation"] == "/your_route") {
            int _yourId = int.tryParse(message.data["id"]) ?? 0;
            Navigator.push(
              navigatorKey.currentState!.context,
                    // navigatorKey.currentState.context,
                    MaterialPageRoute(
                        builder: (context) => Accept(
                              title:_yourId,
                            )));
        }});
      // RemoteNotification ?notification=message.notification;
      // AndroidNotification ?android=message.notification?.android;
      // if(notification!=null && android!=null){
      //   showDialog(
      //   context: context,
      //   builder: (BuildContext context) => new AlertDialog(
      //     title: new Text(channel.id),
      //     content: new Text(channel.name),
      //     actions: <Widget>[
      //       new IconButton(
      //           icon: new Icon(Icons.close),
      //           onPressed: () {
      //             Navigator.pop(context);
      //           })
      //     ],
      //   ));
      // }
        // });
      
  }

  MapType _currentMapType = MapType.normal;

  void _toggleMapType(){    
   setState(() {
       _currentMapType = (_currentMapType == MapType.normal) ? MapType.satellite : MapType.normal;  
   });
}



void showNotification(){
      flutterLocalNotificationsPlugin.show(
        0,
        '+0987654321',
        'New Order: 3323, Ground Floor, GR Tower, Mohali',
        NotificationDetails(android: 
        AndroidNotificationDetails(
        channel.id, 
        channel.name, 
        importance: Importance.high,
        color: Colors.blue,
        playSound: true,
        icon: '@mipmap/ic_launcher'
        )));
    }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Online',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset('assets/images/Layer 1.png'),
            onPressed: () => {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Home()))
            },
          ),
          // elevation: 0,
          actions: [
            Builder(
              builder: (context) => IconButton(
                  icon: Image.asset('assets/images/Group 15214.png'),
                  onPressed: () => SlideDrawer.of(context)?.toggle()),
            ),
          ],
        ),

        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              compassEnabled: false,
              mapToolbarEnabled: false,
              tiltGesturesEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: _currentMapType,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),

            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: 400, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Padding(
                           padding: const EdgeInsets.only(top:30),
                           child: FlutterSwitch(
                             activeTextColor: Colors.transparent,
                             inactiveTextColor: Colors.transparent,
                    width: 50.0,
                    height: 30.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 1.0,
                    activeColor: Color(0xFFfdbc35),
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                        _toggleMapType();
                      });
                    },
                  ),
                         ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      showNotification();
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Image.asset(
                                      'assets/images/up gray arrow.png'),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                          'Select End Time (North-End Boston)',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 80),
                                      child: _buildTimePick(
                                          "Click Button:", true, endTime, (x) {
                                        setState(() {
                                          endTime = x;
                                          print("The picked time is: $x");
                                        });
                                      }),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text('${now.hour}hours ${now.minute}min'),
                                    // ),
                                  ],
                                ),
                                SizedBox(height: 20)
                              ],
                            );
                          });
                    },
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Container(
                                child: DottedBorder(
                                  child: Container(
                                    // alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.red,
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            80, 15, 80, 15),
                                        child: Text(
                                          'start now'.toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white),
                                        )),
                                  ),
                                  color: Colors.white,
                                  strokeWidth: 10,
                                  borderType: BorderType.RRect,
                                  dashPattern: [145, 145],
                                  radius: Radius.circular(20),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: Offset(2, 2),
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
      Function(TimeOfDay) onTimePicked) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GestureDetector(
            child: Text(
              currentTime.format(context),
            ),
            onTap: () {
              selectedTime(context, ifPickedTime, currentTime, onTimePicked);
            },
          ),
        ),
      ],
    );
  }
}

Future selectedTime(BuildContext context, bool ifPickedTime,
    TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
  var _pickedTime =
      await showTimePicker(context: context, initialTime: initialTime);
  if (_pickedTime != null) {
    onTimePicked(_pickedTime);
    Navigator.pop(context);
    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Order()));
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Image.asset('assets/images/up gray arrow.png'),
              ),
              TextButton(
                // onPressed: showNotification,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Order()));
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 220, bottom: 10),
                      child: Text(
                        'West-End',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 140,
                      ),
                      child: TextButton(
                        child: Text('Hotspot for Others',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (BuildContext context,
                                            StateSetter
                                                setState /*You can rename this!*/) =>
                                        ModalFirst());
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class Modal extends StatefulWidget {
  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.5, // half screen on load
        maxChildSize: 1, // full screen on scroll
        minChildSize: 0.25,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
                      child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints:
                      new BoxConstraints(maxHeight: 650.0, maxWidth: 360.0),
                  child: ListView(
                    controller: scrollController,
                                    children:[ Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'assets/images/down arrow.png')),
                                    Text('Your Customer'),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'assets/images/directiondfssd.png'))
                                  ],
                                ),
                                Text('Subrina Lorenshtein',
                                    style: TextStyle(fontSize: 20)),
                                Text('Invoice No. 30WT43gd54'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Pickup by: '),
                                    Text(
                                      '3:22PM',
                                      style: TextStyle(
                                          color: Color(0xFF1d75e6),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Text('Order details:'),
                                  )
                                ]),
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Text('Pickup 4 items'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100),
                                    child: Text('Subtotal: '),
                                  ),
                                  Text(
                                    r'$33.75',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 20, 30, 10),
                                    child: DottedBorder(
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: GestureDetector(
                                              onTap: () => setState(() {
                                                    selected = !selected;
                                                  }),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(50),
                                                    color: selected
                                                        ? Colors.white
                                                        : Colors.green),
                                                child: DottedBorder(
                                                    borderType: BorderType.Circle,
                                                    radius: Radius.circular(10),
                                                    color: selected
                                                        ? Colors.black
                                                        : Colors.green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              11, 7, 11, 7),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                          color: selected
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              )),
                                        ),
                                        Image.asset(
                                            'assets/images/product imagedfsdf.png'),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Chocomocco',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                'Cupcake consequent ',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                'sapien utcursus. duis in molis de',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                      borderType: BorderType.RRect,
                                      color: Colors.grey,
                                      dashPattern: [5, 5],
                                      radius: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                    child: DottedBorder(
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: GestureDetector(
                                              onTap: () => setState(() {
                                                    selected2 = !selected2;
                                                  }),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(50),
                                                    color: selected2
                                                        ? Colors.white
                                                        : Colors.green),
                                                child: DottedBorder(
                                                    borderType: BorderType.Circle,
                                                    radius: Radius.circular(10),
                                                    color: selected2
                                                        ? Colors.black
                                                        : Colors.green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              11, 7, 11, 7),
                                                      child: Text(
                                                        '2',
                                                        style: TextStyle(
                                                          color: selected2
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              )),
                                        ),
                                        Image.asset(
                                            'assets/images/product imageasdsa.png'),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'FooDoorer Fries',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                'Potatoes consequent ',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                'sapien utcursus. duis in molis de',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              //
                                            ],
                                          ),
                                        )
                                      ]),
                                      borderType: BorderType.RRect,
                                      color: Colors.grey,
                                      dashPattern: [5, 5],
                                      radius: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                    child: DottedBorder(
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: GestureDetector(
                                              onTap: () => setState(() {
                                                    selected3 = !selected3;
                                                  }),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(50),
                                                    color: selected3
                                                        ? Colors.white
                                                        : Colors.green),
                                                child: DottedBorder(
                                                    borderType: BorderType.Circle,
                                                    radius: Radius.circular(10),
                                                    color: selected3
                                                        ? Colors.black
                                                        : Colors.green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              11, 7, 11, 7),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                          color: selected3
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              )),
                                        ),
                                        Image.asset(
                                            'assets/images/product imageasdasd.png'),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Burger King',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                'Cras blandit consequent ',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                'sapien utcursus. duis in',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                      borderType: BorderType.RRect,
                                      color: Colors.grey,
                                      dashPattern: [5, 5],
                                      radius: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(30, 0, 30, 10),
                                    child: DottedBorder(
                                      child: Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: GestureDetector(
                                              onTap: () => setState(() {
                                                    selected4 = !selected4;
                                                  }),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(50),
                                                    color: selected4
                                                        ? Colors.white
                                                        : Colors.green),
                                                child: DottedBorder(
                                                    borderType: BorderType.Circle,
                                                    radius: Radius.circular(10),
                                                    color: selected4
                                                        ? Colors.black
                                                        : Colors.green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              11, 7, 11, 7),
                                                      child: Text(
                                                        '1',
                                                        style: TextStyle(
                                                          color: selected4
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                    )),
                                              )),
                                        ),
                                        Image.asset(
                                            'assets/images/product image.png'),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Cocacola(330 ml)',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                'Cras blandit consequent ',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                'sapien utcursus. duis in',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                      borderType: BorderType.RRect,
                                      color: Colors.grey,
                                      dashPattern: [5, 5],
                                      radius: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: OutlinedButton(
                                              onPressed: () => {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Password()))
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    45, 20, 45, 20),
                                                child: Image.asset(
                                                    'assets/images/387-3871744_message-bubble-png-bubble-message-icon-png-clipart.png'),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                side: BorderSide(
                                                    width: 1, color: Colors.blue),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: OutlinedButton(
                                              onPressed: () => {
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Password()))
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    45, 20, 45, 20),
                                                child: Image.asset(
                                                    'assets/images/ic_31_sd.png'),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                side: BorderSide(
                                                    width: 1, color: Colors.red),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, left: 25, right: 25),
                                  child: Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFF265395),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 5.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          elevation: 8.0,
                                          minimumSize: Size(double.infinity,
                                              44), // double.infinity is the width and 30 is the height
                                        ),
                                        onPressed: () {
                                                            Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FinalDelivery()));
                 
                                        },
                                        child: Text(
                                            "Click After Pickup".toUpperCase(),
                                            style: btnWhiteText),
                                      )),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 150.0,
                          bottom: 585.0,
                          child: Container(
                            constraints:
                                new BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: DottedBorder(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFf4b71e),
                                      borderRadius: BorderRadius.circular(30)),
                                  child:
                                      Image.asset('assets/images/Path 14648.png'),
                                ),
                              ),
                              borderType: BorderType.Circle,
                              color: Colors.grey,
                              dashPattern: [5, 5],
                              radius: Radius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),]
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class Modal2 extends StatefulWidget {
  @override
  State<Modal2> createState() => _Modal2State();
}

class _Modal2State extends State<Modal2> {
  bool onChangeColor = false;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.5, // half screen on load
        maxChildSize: 1, // full screen on scroll
        minChildSize: 0.25,
        builder: (BuildContext context, ScrollController scrollController) {
    return SingleChildScrollView(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
      Container(
          constraints: new BoxConstraints(maxHeight: 610.0, maxWidth: 360.0),
          child: Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon:
                                Image.asset('assets/images/down arrow.png')),
                        Text('Your Customer'),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/direction.png'))
                      ],
                    ),
                    Text('Subrina Lorenshtein',
                        style: TextStyle(fontSize: 20)),
                    Text('Invoice No. 30WT43gd54'),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Wait for the customer',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 8, 0),
                      child: Text(
                          'We have notified the customer. You can leave the order if you cant find them soon.'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: OutlinedButton(
                                    onPressed: () => {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Password()))
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          45, 20, 45, 20),
                                      child: Image.asset(
                                          'assets/images/387-3871744_message-bubble-png-bubble-message-icon-png-clipart.png'),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30),
                                      ),
                                      side: BorderSide(
                                          width: 1, color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: onChangeColor
                                      ? Colors.red
                                      : Colors.green),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: OutlinedButton(
                                  onPressed: () => {
                                    setState(() {
                                      onChangeColor = !onChangeColor;
                                    }),
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Password()))
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        45, 20, 45, 20),
                                    child: Image.asset(
                                        'assets/images/kkic_31_sd.png'),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    side: BorderSide(
                                        width: 1,
                                        color: onChangeColor
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 30, right: 30),
                      child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF265395),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              elevation: 8.0,
                              minimumSize: Size(double.infinity,
                                  44), // double.infinity is the width and 30 is the height
                            ),
                            onPressed: () {
                              Navigator.pop(context);

                              showDialog(
                                context: context,
                                builder: (_) => Delivery(),
                              );
                            },
                            child: Text("Click After Delivery".toUpperCase(),
                                style: btnWhiteText),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver To:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('02113,71,Charter str Boston,MA,USA')
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: DottedLine(
                        dashColor: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 140),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upon Arrival:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Go to fifth floor Apt #5r')
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: DottedLine(
                        dashColor: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, top: 10, bottom: 5),
                          child: Text(
                            'Order Details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            '4 Items',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: Text(
                            'Subtotal:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          r'$33.75',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        )
                      ],
                    ),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 20),
                        child: Row(
                          children: [
                            Text('1 '),
                            Text(' Black Bread'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 10),
                        child: Row(
                          children: [
                            Text('4 '),
                            Text(' Chocolate Cupcake'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Text('2 '),
                            Text(' Coca-Cola'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: DottedLine(
                          dashColor: Colors.grey,
                        ),
                      )
                    ])
                  ]),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          right: 150.0,
          bottom: 560.0,
          child: Container(
            constraints:
                new BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: DottedBorder(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf4b71e),
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset('assets/images/Path 14648.png'),
                ),
              ),
              borderType: BorderType.Circle,
              color: Colors.grey,
              dashPattern: [5, 5],
              radius: Radius.circular(30),
            ),
          ),
        ),
      ],
          ),
        ),
          ],
        ),
    );});
  }
}

class ModalFirst extends StatefulWidget {
  @override
  State<ModalFirst> createState() => _ModalFirstState();
}

class _ModalFirstState extends State<ModalFirst> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: new BoxConstraints(maxHeight: 250.0, maxWidth: 360.0),
          child: Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: DottedBorder(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 55),
                                  child: Text(
                                    'Deliver by 3:24 PM',
                                  ),
                                ),
                                Text(' 4 Items')
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Monicas Trattoria',
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(' 5.3 mi total'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: DottedLine(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              r'$7.22',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Guaranteed including tips'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF315797),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 5),
                                      child: TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          showModalBottomSheet<dynamic>(
                                            isScrollControlled: true,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                topLeft: Radius.circular(30),
                                              ),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(
                                                  builder: (BuildContext
                                                              context,
                                                          StateSetter
                                                              setState /*You can rename this!*/) =>
                                                      Modal());
                                            },
                                          );
                                        },
                                        child: Text(
                                          'ACCEPT',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFd63229),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 5, 40, 5),
                                      child: TextButton(
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (_) => LogoutOverlay(),
                                            );
                                          },
                                          child: Text(
                                            'DECLINE',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                    borderType: BorderType.RRect,
                    color: Colors.transparent,
                    dashPattern: [10, 10],
                    radius: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                right: 150.0,
                bottom: 195.0,
                child: Container(
                  constraints:
                      new BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: DottedBorder(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFf4b71e),
                            borderRadius: BorderRadius.circular(30)),
                        child: Image.asset('assets/images/Path 14648.png'),
                      ),
                    ),
                    borderType: BorderType.Circle,
                    color: Colors.grey,
                    dashPattern: [5, 5],
                    radius: Radius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
