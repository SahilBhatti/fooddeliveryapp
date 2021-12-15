
import 'dart:async';

import 'package:demoapp/pages/map/accept_decline.dart';
import 'package:demoapp/pages/map/helpalert.dart';
import 'package:demoapp/pages/map/map1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Confirm extends StatelessWidget {
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
      home: ConfirmView(),
    );
  }
}
class ConfirmView extends StatefulWidget {
  @override
  _ConfirmViewState createState() => _ConfirmViewState();
}
class _ConfirmViewState extends State<ConfirmView> {
  var widget1 ;
var widget2 ;
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
    Timer(
        Duration(seconds: 3),
        () =>  showModalBottomSheet<dynamic>(
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
                                                      Modal2());
                                            },
                                          )
            );
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
              appBar: AppBar(title: Text('Confirm Delivery', style: TextStyle(color:Colors.black, fontSize: 15),),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading:IconButton(
                    icon:Image.asset('assets/images/Layer 1.png'),
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Accept(title: 0,)))
                    },
                  ) ,
      // elevation: 0,
      actions: [
            Builder(
              builder: (context) => TextButton(
                    child: Text('HELP', style: TextStyle(color:Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()async{
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
              initialCameraPosition: _initialLocation,
              compassEnabled: false,
              mapToolbarEnabled: false,
              tiltGesturesEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
                  SizedBox(
                    height: 20,
                  ),
                  
          ],
        ),
      ),
          ],
        ),
      ),
    );
  }
}


