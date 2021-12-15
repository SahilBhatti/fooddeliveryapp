// // import 'dart:async';

// import 'package:demoapp/pages/map/accept_decline.dart';
// import 'package:demoapp/pages/map/helpalert.dart';
// import 'package:demoapp/pages/newmap/direction_modal/direction_modal.dart';
// import 'package:demoapp/pages/newmap/direction_repository/repository.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(FinalDelivery());
// }

// class FinalDelivery extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//     @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//     // Timer(
//     //     Duration(seconds: 3),
//     //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//     //         builder: (BuildContext context) => Order())));
//   }
//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(37.773972, -122.431297),
//     zoom: 11.5,
//   );

//   GoogleMapController ?_googleMapController;
//   Marker? _origin;
//   Marker?_destination;
//   Directions ?_info;

//   @override
//   void dispose() {
//     _googleMapController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title:  Text(
//                   'Start Final Delivery',
//                   style: TextStyle(color: Colors.black, fontSize: 15),
//                 ) ,
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           centerTitle: true,
//           leading: IconButton(
//             icon: Image.asset('assets/images/Layer 1.png'),
//             onPressed: () => {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => Accept()))
//             },
//           ),
//           // elevation: 0,
//           actions: [
//             Builder(
//               builder: (context) => TextButton(
//                 child: Text(
//                   'HELP',
//                   style:
//                       TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                 ),
//                 onPressed: () async {
//                   showDialog(
//                     context: context,
//                     builder: (_) => (Help()),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           GoogleMap(
//             myLocationButtonEnabled: true,
//             zoomControlsEnabled: true,
//             initialCameraPosition: _initialCameraPosition,
//             onMapCreated: (controller) => _googleMapController = controller,
//             markers: {
//               if (_origin != null) _origin!,
//               if (_destination != null) _destination!
//             },
//             polylines: {
//               if (_info != null)
//                 Polyline(
//                   polylineId: const PolylineId('overview_polyline'),
//                   color: Colors.red,
//                   width: 5,
//                   points: _info!.polylinePoints
//                       .map((e) => LatLng(e.latitude, e.longitude))
//                       .toList(),
//                 ),
//             },
            
//             onLongPress: _addMarker,
//           ),

          
//           if (_info != null)
//             Positioned(
//               top: 20.0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 6.0,
//                   horizontal: 12.0,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.yellowAccent,
//                   borderRadius: BorderRadius.circular(20.0),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0, 2),
//                       blurRadius: 6.0,
//                     )
//                   ],
//                 ),
//                 child: Text(
//                   '${_info!.totalDistance}, ${_info!.totalDuration}',
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         foregroundColor: Colors.black,
//         onPressed: () => _googleMapController?.animateCamera(
//           _info != null
//               ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
//               : CameraUpdate.newCameraPosition(_initialCameraPosition),
//         ),
//         child: const Icon(Icons.center_focus_strong),
//       ),
//     );
//   }

//   void _addMarker(LatLng pos) async {
//     if (_origin == null || (_origin != null && _destination != null)) {
//       // Origin is not set OR Origin/Destination are both set
//       // Set origin
//       setState(() {
//         _origin = Marker(
//           markerId: const MarkerId('origin'),
//           infoWindow: const InfoWindow(title: 'Origin'),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos,
//         );
//         // Reset destination
//         _destination = null;

//         // Reset info
//         _info = null;
//       });
//     } else {
//       // Origin is already set
//       // Set destination
//       setState(() {
//         _destination = Marker(
//           markerId: const MarkerId('destination'),
//           infoWindow: const InfoWindow(title: 'Destination'),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           position: pos,
//         );
//       });

//       // Get directions
//       final directions = await DirectionsRepository()
//           .getDirections(origin: _origin!.position, destination: pos);
//       setState(() => _info = directions);
//     }
//   }

//     late Position _currentPosition;
//   String _currentAddress = '';

//     _getCurrentLocation() async {
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) async {
//       setState(() {
//         _currentPosition = position;
//         print('CURRENT POS: $_currentPosition');
//         _googleMapController?.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(position.latitude, position.longitude),
//               zoom: 18.0,
//             ),
//           ),
//         );
//       });
//       await _getAddress();
//     }).catchError((e) {
//       print(e);
//     });
//   }
//     _getAddress() async {
//     try {
//       List<Placemark> p = await placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);
//       Placemark place = p[0];
//       setState(() {
//         _currentAddress =
//             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
//         startAddressController.text = _currentAddress;
//         // _startAddress = _currentAddress;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//   final startAddressController = TextEditingController();
// }









// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class Confirm extends StatefulWidget{
// //   @override
// //   State<Confirm> createState() => _ConfirmState();
// // }

// // const LatLng dest_location = LatLng(30.704649, 76.717873);

// // class _ConfirmState extends State<Confirm> {
// //   GoogleMapController ?mapController;

// //   // Markers to show points on the map
// //   Map<MarkerId, Marker> markers = {};
// //   Map<PolylineId, Polyline> polylines = {};
// //   List<LatLng> polylineCoordinates = [];

// //   PolylinePoints polylinePoints = PolylinePoints();

// //   Completer<GoogleMapController> _controller = Completer();
// //   static final CameraPosition _kGooglePlex = CameraPosition(
// //     target: LatLng(30.741482, 76.768066),
// //     zoom: 18,
// //   );

// //   Position ?currentPosition;
// //   var geoLocator = Geolocator();
// //   var locationOptions = LocationOptions(
// //       accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 4);

// //   void getCurrentPosition() async {
// //     currentPosition = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.bestForNavigation);
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     getCurrentPosition();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     CameraPosition initialCameraPosition = _kGooglePlex;
// //     if (currentPosition != null) {
// //       initialCameraPosition = CameraPosition(
// //           target: LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //           zoom: 14.4746);
// //     }
// //     return MaterialApp(
// //       home: Scaffold(
// //               appBar: AppBar(
// //         backgroundColor: Colors.grey,
// //         centerTitle: false,
// //         title: const Text('Google Maps'),
// //         actions: [
// //           // if (_origin != null)
// //             // TextButton(
// //             //   onPressed: () => _controller.animateCamera(
// //             //     CameraUpdate.newCameraPosition(
// //             //       CameraPosition(
// //             //         target: currentPosition!.position,
// //             //         zoom: 14.5,
// //             //         tilt: 50.0,
// //             //       ),
// //             //     ),
// //             //   ),
// //             //   style: TextButton.styleFrom(
// //             //     primary: Colors.green,
// //             //     textStyle: const TextStyle(fontWeight: FontWeight.w600),
// //             //   ),
// //             //   child: const Text('ORIGIN'),
// //             // ),
// //           // if (_destination != null)
// //           //   TextButton(
// //           //     onPressed: () => _googleMapController?.animateCamera(
// //           //       CameraUpdate.newCameraPosition(
// //           //         CameraPosition(
// //           //           target: _destination!.position,
// //           //           zoom: 14.5,
// //           //           tilt: 50.0,
// //           //         ),
// //           //       ),
// //           //     ),
// //           //     style: TextButton.styleFrom(
// //           //       primary: Colors.blue,
// //           //       textStyle: const TextStyle(fontWeight: FontWeight.w600),
// //           //     ),
// //           //     child: const Text('DEST'),
// //           //   )
// //         ],
// //       ),
// //         body: GoogleMap(
// //           zoomGesturesEnabled:true,
// //           padding: EdgeInsets.only(top: 135),
// //           myLocationButtonEnabled: true,
// //           myLocationEnabled: true,
// //           mapType: MapType.normal,
// //           initialCameraPosition: initialCameraPosition,
// //           onMapCreated: (GoogleMapController controller) {
// //             _controller.complete(controller);
// //             mapController = controller;
// //             _getPolyline();
// //           },
// //           polylines: Set<Polyline>.of(polylines.values),
// //           markers: Set<Marker>.of(markers.values),
// //         ),
// //       ),
// //     );
// //   }

// //   // This method will add markers to the map based on the LatLng position
// //   _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
// //     MarkerId markerId = MarkerId(id);
// //     Marker marker =
// //         Marker(markerId: markerId, icon: descriptor, position: position,
// //         infoWindow: InfoWindow(
// //       title: 'The title of the marker'
// //       ));
// //     markers[markerId] = marker;
// //   }

// //   _addPolyLine(List<LatLng> polylineCoordinates) {
// //     PolylineId id = PolylineId("poly");
// //     Polyline polyline = Polyline(
// //       color: Colors.red,
// //       polylineId: id,
// //       points: polylineCoordinates,
// //       width: 10,
// //     );
// //     polylines[id] = polyline;
// //     setState(() {});
// //   }

// //   void _getPolyline() async {
// //     /// add origin marker origin marker
// //     _addMarker(
// //       LatLng(currentPosition!.latitude, currentPosition!.longitude),
// //       "origin",
// //       BitmapDescriptor.defaultMarker,
// //     );

// //     // Add destination marker
// //     _addMarker(
// //       LatLng(dest_location.latitude, dest_location.longitude),
// //       "destination",
// //       BitmapDescriptor.defaultMarkerWithHue(90),
      
// //     );

// //   //   _markers.add(
// //   //     Marker(
// //   //     markerId: MarkerId('SomeId'),
// //   //     position: LatLng(38.123,35.123),
// //   //     infoWindow: InfoWindow(
// //   //     title: 'The title of the marker'
// //   //     )
// //   //    )
// //   //  );

// //     List<LatLng> polylineCoordinates = [];

// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       "AIzaSyBTzw9b9M9ZgxFyxp30bqGoOz6Kn2K_6bQ",
// //       PointLatLng(currentPosition!.latitude, currentPosition!.longitude),
// //       PointLatLng(dest_location.latitude, dest_location.longitude),
// //       travelMode: TravelMode.walking,
// //     );
// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     } else {
// //       print(result.errorMessage);
// //     }
// //     _addPolyLine(polylineCoordinates);
// //   }
// // }






















// // import 'dart:async';

// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // const LatLng SOURCE_LOCATION = LatLng(13.652720, 100.493635);
// // const LatLng DEST_LOCATION = LatLng(13.6640896, 100.4357021);

// // class Confirm extends StatefulWidget {
// //   @override
// //   _ConfirmState createState() => _ConfirmState();
// // }

// // class _ConfirmState extends State<Confirm> {
// //   Completer<GoogleMapController> mapController = Completer();

// //   Set<Marker> _markers = Set<Marker>();
// //   LatLng ?currentLocation;
// //   LatLng ?destinationLocation;

// //   Set<Polyline> _polylines = Set<Polyline>();
// //   List<LatLng> polylineCoordinates = [];
// //   PolylinePoints? polylinePoints;

// //   @override
// //   void initState() {
// //     super.initState();
// //     polylinePoints = PolylinePoints();
// //     this.setInitialLocation();
// //      _polylines.add(Polyline(
// //             width: 10,
// //             polylineId: PolylineId('polyLine'),
// //             color: Colors.black,
// //             points: polylineCoordinates));
// //   }

// //   void setInitialLocation() {
// //     currentLocation =
// //         LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);
// //     destinationLocation =
// //         LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Direction"),
// //         actions: [
// //           TextButton(onPressed: (){
// //           setState(() {
// //             setPolylines();
// //           });
// //         }, child: Center(child: Text('data',style: TextStyle(color:Colors.black,fontSize:20),)))
// //         ],
// //       ),
// //       body: Stack(
// //               children: [GoogleMap(
// //           myLocationEnabled: true,
// //           compassEnabled: false,
// //           tiltGesturesEnabled: false,
// //           polylines: _polylines,
// //           markers: _markers,
// //           onMapCreated: (GoogleMapController controller) {
// //             mapController.complete(controller);

// //             showMarker();
// //             setState(() {
// //               setPolylines();
// //             });
// //           },
// //           initialCameraPosition: CameraPosition(
// //             target: SOURCE_LOCATION,
// //             zoom: 13,
// //           ),
// //         ),
        
// //         ]
// //       ),
// //     );
// //   }

// //   void showMarker() {
// //     setState(() {
// //       _markers.add(Marker(
// //         markerId: MarkerId('sourcePin'),
// //         position: currentLocation!,
// //         icon: BitmapDescriptor.defaultMarker,
// //       ));

// //       _markers.add(Marker(
// //         markerId: MarkerId('destinationPin'),
// //         position: destinationLocation!,
// //         icon: BitmapDescriptor.defaultMarkerWithHue(90),
// //       ));
// //     });
// //   }

// //   void setPolylines() async {
// //     PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
// //         "AIzaSyCjZHsS0c1Iwtl62mR45AFV3wF0caxesaY",
// //         PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
// //         PointLatLng(
// //             destinationLocation!.latitude, destinationLocation!.longitude));

// //     if (result.status == 'OK') {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });

// //       setState(() {
// //         _polylines.add(Polyline(
// //             width: 10,
// //             polylineId: PolylineId('polyLine'),
// //             color: Color(0xFF08A5CB),
// //             points: polylineCoordinates));
// //       });
// //     }
// //   }
// // }









import 'dart:async';
import 'package:demoapp/pages/map/accept_decline.dart';
import 'package:demoapp/pages/map/confirm/confirm_delivery.dart';
import 'package:demoapp/pages/map/helpalert.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinalDelivery extends StatefulWidget {
  @override
  FinalDeliveryState createState() => FinalDeliveryState();
}

class FinalDeliveryState extends State<FinalDelivery> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text(
                  'Start Final Delivery',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset('assets/images/Layer 1.png'),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Accept(title: 0,)))
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
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

 Widget _zoomminusfunction() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 Widget _zoomplusfunction() {
   
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: _boxes(
            //       "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
            //       40.761421, -73.981667,"Le Bernardin"),
            // ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128, -73.999619,"Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
        onTap: () {
          _gotoLocation(lat,long);

        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Confirm()));
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(40.738380, -73.988426),
  infoWindow: InfoWindow(title: 'Gramercy Tavern'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(40.761421, -73.981667),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(40.742451, -74.005959),
  infoWindow: InfoWindow(title: 'Los Tacos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(40.729640, -73.983510),
  infoWindow: InfoWindow(title: 'Tree Bistro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(40.719109, -74.000183),
  infoWindow: InfoWindow(title: 'Le Coucou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);