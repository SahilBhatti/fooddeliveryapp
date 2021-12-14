import 'package:demoapp/pages/map/decline/alertdialog.dart';
import 'package:demoapp/pages/map/helpalert.dart';
import 'package:demoapp/pages/map/lookingfororders.dart';
import 'package:demoapp/pages/map/map1.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Accept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   // primarySwatch: Colors.blue,
      // ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      home: AcceptView(),
    );
  }
}

class AcceptView extends StatefulWidget {
  @override
  _AcceptViewState createState() => _AcceptViewState();
}

class _AcceptViewState extends State<AcceptView> {
  Set<Polyline> lines = {};
  // Completer<GoogleMapController> _controller = Completer();
  TimeOfDay endTime = TimeOfDay.now();
  var widget1;
  var widget2;
  // CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
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

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(30.704649, 76.717873), zoom: 10);

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
    lines.add(
      Polyline(
        color: Colors.blue,
        points: [
          LatLng(31.385296, 76.374893),
          LatLng(30.975254, 76.527328),
          LatLng(30.704649, 76.717873)
        ],
        endCap: Cap.squareCap,
        geodesic: false,
        polylineId: PolylineId("line_one"),
      ),
    );
    lines.add(
      Polyline(
        points: [LatLng(30.704649, 76.717873), LatLng(30.741482, 76.768066)],
        color: Colors.greenAccent,
        polylineId: PolylineId("line_one"),
      ),
    );
    // Future.delayed(Duration(seconds: 1), () {
    //         print('yo hey');
    //       });
  }

  bool status = false;
  MapType _currentMapType = MapType.normal;

  void _toggleMapType() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.satellite
          : MapType.normal;
    });
  }

  bool appBarName = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // DateTime now = new DateTime.now();

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:Text(
                  'Accept or Decline',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset('assets/images/Layer 1.png'),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetLocation()))
            },
          ),
          // elevation: 0,
          actions: [
            Builder(
              builder: (context) => TextButton(
                child: Text(
                  'HELP',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (_) => (Help()),
                  );
                },
              ),
            )
          ],
        ),

        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _kGooglePlex,
              compassEnabled: false,
              mapToolbarEnabled: false,
              tiltGesturesEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: _currentMapType,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              // polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              polylines: lines,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 500, right: 200),
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
    );
  }

  Future selectedTime(BuildContext context, bool ifPickedTime,
      TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
    var _pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (_pickedTime != null) {
      onTimePicked(_pickedTime);
      Navigator.pop(context);
      // Future.delayed(Duration(seconds: 1), () {
      //         print('yo hey');
      //       });
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
                                backgroundColor: Colors.black,
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (BuildContext context,
                                              StateSetter
                                                  setState /*You can rename this!*/) =>
                                          Modal3());
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
}

class Modal3 extends StatefulWidget {
  @override
  State<Modal3> createState() => _Modal3State();
}

class _Modal3State extends State<Modal3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // code
        Stack(
          children: <Widget>[
            Container(
              // constraints:
              //     new BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
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
            Container(
              height: 225,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: DottedBorder(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF315797),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                child: TextButton(
                                  onPressed: () {
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
                                padding:
                                    const EdgeInsets.fromLTRB(40, 5, 40, 5),
                                child: TextButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (_) => LogoutOverlay(),
                                      );
                                    },
                                    child: Text(
                                      'DECLINE',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
                borderType: BorderType.RRect,
                color: Colors.grey,
                dashPattern: [10, 10],
                radius: Radius.circular(30),
              ),
            ),
          ],
        ),
      ],
    );
  }
}