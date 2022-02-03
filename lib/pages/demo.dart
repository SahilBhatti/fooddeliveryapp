// // import 'dart:async';
// // import 'dart:convert';
// // import 'dart:math';
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location/location.dart';

// // //  const String _baseUrl =
// // //       'https://maps.googleapis.com/maps/api/directions/json?';

// // Future<void> main() async {
// //   // WidgetsFlutterBinding.ensureInitialized();
// //   runApp(GetLocation());
// // }

// // class GetLocation extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Google Map',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MapView(),
// //     );
// //   }
// // }

// // class MapView extends StatefulWidget {
// //   const MapView({Key? key}) : super(key: key);

// //   @override
// //   _MapViewState createState() => _MapViewState();
// // }

// // class _MapViewState extends State<MapView> {
// //   LatLng sourceLocation = LatLng(30.697600, 76.692280);
// //   LatLng destinationLatlng = LatLng(30.704649, 76.717873);

// // var array=[];
// //   Future<void> _time() async {
// //      Dio dio = new Dio();
// //     Response response = await dio.get(
// //         "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=30.697600,76.692280&destinations=30.704649,76.717873&key=AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ");
// //     print(response.data['destination_addresses'][0]);
// //     print("aaaaaaaaaaaaaaaa");
// //     print(response.data['rows'][0]['elements']);
// //     print("bbbbbbbbbbbbbbbbbbbbbb");
// //     print(response.data['origin_addresses'][0]);
// //     print(response.data['rows'][0]['elements'][0]['distance']['text']);
// //     print(response.data['rows'][0]['elements'][0]['duration']['text']);
// //     print("cccccccccccc");
// //     var durationTime =
// //         response.data['rows'][0]['elements'][0]['distance']['text'];
// //     print(durationTime);
// //     var array = [
// //       response.data['origin_addresses'][0],
// //       response.data['destination_addresses'][0],
// //       response.data['rows'][0]['elements'][0]['distance']['text'],
// //       response.data['rows'][0]['elements'][0]['duration']['text']
// //     ];
// //     print(array);
// //     array = jsonDecode(response.data);
// //     print("array");
// //     if (response.data == 200) {
// //       return ;
// //     }return ;
// //     // return array;
// //     //   print("response.data");
// //   }
// //    getData () {
// //   return print(array);
// //   // print(array);
// // }

// //   // data()async{
// //   //   print(array);
// //   // }
// //   // print(array);

// //   Set<Marker> _marker = Set<Marker>();

// //   Set<Polyline> _polylines = Set<Polyline>();
// //   List<LatLng> polylineCoordinates = [];
// //   late PolylinePoints polylinePoints;

// //   late StreamSubscription<LocationData> subscription;
// //   Completer<GoogleMapController> _controller = Completer();
// //   LocationData? currentLocation;
// //   late LocationData destinationLocation;
// //   late Location location;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _calculate();
// //     _time();
// //     getData();
// //     location = Location();
// //     polylinePoints = PolylinePoints();

// //     subscription = location.onLocationChanged.listen((clocation) {
// //       currentLocation = clocation;
// //       var live = currentLocation;
// //       print(live);
// //       updatePinsOnMap();
// //     });

// //     setInitialLocation();
// //   }

// //   void setInitialLocation() async {
// //     await location.getLocation().then((value) {
// //       currentLocation = value;
// //       setState(() {});
// //     });

// //     destinationLocation = LocationData.fromMap({
// //       "latitude": destinationLatlng.latitude,
// //       "longitude": destinationLatlng.longitude,
// //     });
// //   }

// //   String? _placeDistance;
// //   showLocationPins() async {
// //     var sourceposition = LatLng(
// //         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

// //     var destinationPosition =
// //         LatLng(destinationLatlng.latitude, destinationLatlng.longitude);

// //     _marker.add(Marker(
// //       markerId: MarkerId('sourcePosition'),
// //       position: sourceposition,
// //     ));

// //     _marker.add(
// //       Marker(
// //         markerId: MarkerId('destinationPosition'),
// //         position: destinationPosition,
// //       ),
// //     );

// //     await setPolylinesInMap();
// //     double totalDistance = 0.0;
// //     // Calculating the total distance by adding the distance
// //     // between small segments
// //     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// //       totalDistance += _coordinateDistance(
// //         polylineCoordinates[i].latitude,
// //         polylineCoordinates[i].longitude,
// //         polylineCoordinates[i + 1].latitude,
// //         polylineCoordinates[i + 1].longitude,
// //       );
// //     }
// //     setState(() {
// //       _placeDistance = totalDistance.toStringAsFixed(2);
// //       print('DISTANCE: $_placeDistance km');
// //     });

// //     // setPolylinesInMap();
// //   }

// //   double _coordinateDistance(lat1, lon1, lat2, lon2) {
// //     var p = 0.017453292519943295;
// //     var c = cos;
// //     var a = 0.5 -
// //         c((lat2 - lat1) * p) / 2 +
// //         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
// //     return 12742 * asin(sqrt(a));
// //   }

// //   _calculate() {
// //     double totalDistance = 0.0;
// //     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// //       totalDistance += _coordinateDistance(
// //         polylineCoordinates[i].latitude,
// //         polylineCoordinates[i].longitude,
// //         polylineCoordinates[i + 1].latitude,
// //         polylineCoordinates[i + 1].longitude,
// //       );
// //     }
// //     setState(() {
// //       _placeDistance = totalDistance.toStringAsFixed(2);
// //       print('DISTANCE: $_placeDistance km');
// //     });

// //     return true;
// //   }

// //   setPolylinesInMap() async {
// //     var result = await polylinePoints.getRouteBetweenCoordinates(
// //       "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ",
// //       PointLatLng(
// //           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
// //       PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
// //     );

// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((pointLatLng) {
// //         polylineCoordinates
// //             .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
// //       });
// //     }

// //     setState(() {
// //       _polylines.add(Polyline(
// //         width: 5,
// //         polylineId: PolylineId('polyline'),
// //         color: Colors.blueAccent,
// //         points: polylineCoordinates,
// //       ));
// //       print(polylineCoordinates);
// //       print("polylineCoordinates");
// //     });
// //   }

// //   void updatePinsOnMap() async {
// //     CameraPosition cameraPosition = CameraPosition(
// //       zoom: 20,
// //       tilt: 80,
// //       bearing: 30,
// //       target: LatLng(
// //           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
// //     );

// //     final GoogleMapController controller = await _controller.future;

// //     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

// //     var sourcePosition = LatLng(
// //         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

// //     setState(() {
// //       _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

// //       _marker.add(Marker(
// //         markerId: MarkerId('sourcePosition'),
// //         position: sourcePosition,
// //       ));
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     CameraPosition initialCameraPosition = CameraPosition(
// //       zoom: 20,
// //       tilt: 80,
// //       bearing: 30,
// //       target: currentLocation != null
// //           ? LatLng(currentLocation!.latitude ?? 0.0,
// //               currentLocation!.longitude ?? 0.0)
// //           : LatLng(0.0, 0.0),
// //     );

// //     return currentLocation == null
// //         ? Container(
// //             height: MediaQuery.of(context).size.height,
// //             width: MediaQuery.of(context).size.width,
// //             alignment: Alignment.center,
// //             child: CircularProgressIndicator(),
// //           )
// //         : SafeArea(
// //             child: Scaffold(
// //               body: Stack(
// //                 children: [
// //                   GoogleMap(
// //                     myLocationButtonEnabled: true,
// //                     compassEnabled: true,
// //                     markers: _marker,
// //                     polylines: _polylines,
// //                     mapType: MapType.normal,
// //                     initialCameraPosition: initialCameraPosition,
// //                     onMapCreated: (GoogleMapController controller) {
// //                       _controller.complete(controller);

// //                       showLocationPins();
// //                     },
// //                   ),
// //                   // Text(array.toString()),
// //                   //    Text(
// //                   //   "array",
// //                   //   style: const TextStyle(
// //                   //     fontSize: 18.0,
// //                   //     fontWeight: FontWeight.w600,
// //                   //   ),
// //                   // ),
// //                   Align(
// //                       alignment: Alignment.bottomCenter,
// //                       child: Text("Distance=$_placeDistance km"))
// //                 ],
// //               ),
// //             ),
// //           );
// //   }

// //   @override
// //   void dispose() {
// //     subscription.cancel();
// //     super.dispose();
// //   }
// // }

// // // class Directions {
// // //   final LatLngBounds bounds;
// // //   final List<PointLatLng> polylinePoints;
// // //   final String totalDistance;
// // //   final String totalDuration;

// // //   const Directions({
// // //     required this.bounds,
// // //     required this.polylinePoints,
// // //     required this.totalDistance,
// // //     required this.totalDuration,
// // //   });

// // //   static Directions? fromMap(Map<String, dynamic> map) {
// // //     // Check if route is not available
// // //     if ((map['routes'] as List).isEmpty) return null;

// // //     // Get route information
// // //     final data = Map<String, dynamic>.from(map['routes'][0]);

// // //     // Bounds
// // //     final northeast = data['bounds']['northeast'];
// // //     final southwest = data['bounds']['southwest'];
// // //     final bounds = LatLngBounds(
// // //       northeast: LatLng(northeast['lat'], northeast['lng']),
// // //       southwest: LatLng(southwest['lat'], southwest['lng']),
// // //     );

// // //     // Distance & Duration
// // //     String distance = '';
// // //     String duration = '';
// // //     if ((data['legs'] as List).isNotEmpty) {
// // //       final leg = data['legs'][0];
// // //       distance = leg['distance']['text'];
// // //       duration = leg['duration']['text'];
// // //     }

// // //     return Directions(
// // //       bounds: bounds,
// // //       polylinePoints:
// // //           PolylinePoints().decodePolyline(data['overview_polyline']['points']),
// // //       totalDistance: distance,
// // //       totalDuration: duration,
// // //     );
// // //   }
// // // }
// // // class Directions {
// // //   final LatLngBounds bounds;
// // //   final List<PointLatLng> polylinePoints;
// // //   final String totalDistance;
// // //   final String totalDuration;

// // //   const Directions({
// // //     required this.bounds,
// // //     required this.polylinePoints,
// // //     required this.totalDistance,
// // //     required this.totalDuration,
// // //   });

// // //   static Directions?fromMap(Map<String, dynamic> map) {
// // //     // Check if route is not available
// // //     if ((map['routes'] as List).isEmpty) return null;

// // //     // Get route information
// // //     final data = Map<String, dynamic>.from(map['routes'][0]);

// // //     // Bounds
// // //     final northeast = data['bounds']['northeast'];
// // //     final southwest = data['bounds']['southwest'];
// // //     final bounds = LatLngBounds(
// // //       northeast: LatLng(northeast['lat'], northeast['lng']),
// // //       southwest: LatLng(southwest['lat'], southwest['lng']),
// // //     );

// // //     // Distance & Duration
// // //     String distance = '';
// // //     String duration = '';
// // //     if ((data['legs'] as List).isNotEmpty) {
// // //       final leg = data['legs'][0];
// // //       distance = leg['distance']['text'];
// // //       duration = leg['duration']['text'];
// // //     }

// // //     return Directions(
// // //       bounds: bounds,
// // //       polylinePoints:
// // //           PolylinePoints().decodePolyline(data['overview_polyline']['points']),
// // //       totalDistance: distance,
// // //       totalDuration: duration,
// // //     );
// // //   }
// // // }

// // // import 'dart:async';

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // // import 'package:geocoding/geocoding.dart';
// // // import 'package:geolocator/geolocator.dart';
// // // //import 'package:google_map/secrets.dart';
// // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // import 'dart:math' show cos, sqrt, asin;

// // // Future<void> main() async {
// // //   // WidgetsFlutterBinding.ensureInitialized();
// // //   runApp(GetLocation());
// // // }

// // // class GetLocation extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Google Map',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: MapView(),
// // //     );
// // //   }
// // // }

// // // class MapView extends StatefulWidget {
// // //   @override
// // //   _MapViewState createState() => _MapViewState();
// // // }

// // // class _MapViewState extends State<MapView> {
// // //   //   late StreamSubscription<LocationData> subscription;
// // // //   Completer<GoogleMapController> _controller = Completer();
// // // //   LocationData? currentLocation;
// // // //   late LocationData destinationLocation;
// // // //   late Location location;
// // //   CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
// // //   late GoogleMapController mapController;
// // //   late Position _currentPosition;
// // //   String _currentAddress = '';
// // //   final startAddressController = TextEditingController();
// // //   final destinationAddressController = TextEditingController();
// // //   final startAddressFocusNode = FocusNode();
// // //   final desrinationAddressFocusNode = FocusNode();
// // //   String _startAddress = '';
// // //   String _destinationAddress = '';
// // //   // String _newAddress = '';
// // //   // String _newdestinationAddress = '';
// // //   String? _placeDistance;
// // //   Set<Marker> markers = {};
// // //   late PolylinePoints polylinePoints;
// // //   Map<PolylineId, Polyline> polylines = {};
// // //   Set<Polyline> lines = {};
// // //   List<LatLng> polylineCoordinates = [];
// // //   final _scaffoldKey = GlobalKey<ScaffoldState>();
// // //   // Method for retrieving the current location
// // //   _getCurrentLocation() async {
// // //     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
// // //         .then((Position position) async {
// // //       setState(() {
// // //         _currentPosition = position;
// // //         print('CURRENT POS: $_currentPosition');
// // //         mapController.animateCamera(
// // //           CameraUpdate.newCameraPosition(
// // //             CameraPosition(
// // //               target: LatLng(position.latitude, position.longitude),
// // //               zoom: 18.0,
// // //             ),
// // //           ),
// // //         );
// // //       });
// // //       await _getAddress();
// // //       print(position.latitude);
// // //       print(position.longitude);
// // //     }).catchError((e) {
// // //       print(e);
// // //     });
// // //   }

// // //   // Method for retrieving the address
// // //   _getAddress() async {
// // //     // mapController.animateCamera(
// // //     //                           CameraUpdate.zoomIn());

// // //     try {
// // //       List<Placemark> p = await placemarkFromCoordinates(
// // //           _currentPosition.latitude, _currentPosition.longitude);
// // //       Placemark place = p[0];
// // //       setState(() {
// // //         _currentAddress =
// // //             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
// // //         // startAddressController.text = _currentAddress;
// // //         // _startAddress = _currentAddress;
// // //         _startAddress = "3086, sector 72 Mohali";
// // //         var liveLocation = _currentAddress;
// // //         print(liveLocation);
// // //         var destination = "Sohana, Mohali, Punjab";
// // //         print(destination);
// // //         _startAddress = liveLocation;
// // //         _destinationAddress = destination;
// // //         polyline();
// // //       });
// // //     } catch (e) {
// // //       print(e);
// // //     }
// // //   }

// // //   // Method for calculating the distance between two places
// // //   Future<bool> _calculateDistance() async {
// // //     try {
// // //       // Retrieving placemarks from addresses
// // //       List<Location> startPlacemark = await locationFromAddress(_startAddress);
// // //       List<Location> destinationPlacemark =
// // //           await locationFromAddress(_destinationAddress);
// // //       // Use the retrieved coordinates of the current position,
// // //       // instead of the address if the start position is user's
// // //       // current position, as it results in better accuracy.
// // //       double startLatitude = _startAddress == _currentAddress
// // //           ? _currentPosition.latitude
// // //           : startPlacemark[0].latitude;
// // //       double startLongitude = _startAddress == _currentAddress
// // //           ? _currentPosition.longitude
// // //           : startPlacemark[0].longitude;
// // //       double destinationLatitude = destinationPlacemark[0].latitude;
// // //       double destinationLongitude = destinationPlacemark[0].longitude;
// // //       String startCoordinatesString = '($startLatitude, $startLongitude)';
// // //       String destinationCoordinatesString =
// // //           '($destinationLatitude, $destinationLongitude)';
// // //       // Start Location Marker
// // //       Marker startMarker = Marker(
// // //         markerId: MarkerId(startCoordinatesString),
// // //         position: LatLng(startLatitude, startLongitude),
// // //         infoWindow: InfoWindow(
// // //           title: 'Start $startCoordinatesString',
// // //           snippet: _startAddress,
// // //         ),
// // //         icon: BitmapDescriptor.defaultMarker,
// // //       );
// // //       // Destination Location Marker
// // //       Marker destinationMarker = Marker(
// // //         markerId: MarkerId(destinationCoordinatesString),
// // //         position: LatLng(destinationLatitude, destinationLongitude),
// // //         infoWindow: InfoWindow(
// // //           title: 'Destination $destinationCoordinatesString',
// // //           snippet: _destinationAddress,
// // //         ),
// // //         icon: BitmapDescriptor.defaultMarker,
// // //       );
// // //       // Adding the markers to the list
// // //       markers.add(startMarker);
// // //       markers.add(destinationMarker);
// // //       print(
// // //         'START COORDINATES: ($startLatitude, $startLongitude)',
// // //       );
// // //       print(
// // //         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
// // //       );
// // //       // Calculating to check that the position relative
// // //       // to the frame, and pan & zoom the camera accordingly.
// // //       double miny = (startLatitude <= destinationLatitude)
// // //           ? startLatitude
// // //           : destinationLatitude;
// // //       double minx = (startLongitude <= destinationLongitude)
// // //           ? startLongitude
// // //           : destinationLongitude;
// // //       double maxy = (startLatitude <= destinationLatitude)
// // //           ? destinationLatitude
// // //           : startLatitude;
// // //       double maxx = (startLongitude <= destinationLongitude)
// // //           ? destinationLongitude
// // //           : startLongitude;
// // //       double southWestLatitude = miny;
// // //       double southWestLongitude = minx;
// // //       double northEastLatitude = maxy;
// // //       double northEastLongitude = maxx;
// // //       // Accommodate the two locations within the
// // //       // camera view of the map
// // //       mapController.animateCamera(
// // //         CameraUpdate.newLatLngBounds(
// // //           LatLngBounds(
// // //             northeast: LatLng(northEastLatitude, northEastLongitude),
// // //             southwest: LatLng(southWestLatitude, southWestLongitude),
// // //           ),
// // //           100.0,
// // //         ),
// // //       );
// // //       // Calculating the distance between the start and the end positions
// // //       // with a straight path, without considering any route
// // //       // double distanceInMeters = await Geolocator.bearingBetween(
// // //       //   startLatitude,
// // //       //   startLongitude,
// // //       //   destinationLongitude,
// // //       // );
// // //       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
// // //           destinationLongitude);
// // //       double totalDistance = 0.0;
// // //       // Calculating the total distance by adding the distance
// // //       // between small segments
// // //       for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// // //         totalDistance += _coordinateDistance(
// // //           polylineCoordinates[i].latitude,
// // //           polylineCoordinates[i].longitude,
// // //           polylineCoordinates[i + 1].latitude,
// // //           polylineCoordinates[i + 1].longitude,
// // //         );
// // //       }
// // //       setState(() {
// // //         _placeDistance = totalDistance.toStringAsFixed(2);
// // //         print('DISTANCE: $_placeDistance km');
// // //       });

// // //       return true;
// // //     } catch (e) {
// // //       print(e);
// // //     }
// // //     return false;
// // //   }
// // //   // Formula for calculating distance between two coordinates

// // //   double _coordinateDistance(lat1, lon1, lat2, lon2) {
// // //     var p = 0.017453292519943295;
// // //     var c = cos;
// // //     var a = 0.5 -
// // //         c((lat2 - lat1) * p) / 2 +
// // //         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
// // //     return 12742 * asin(sqrt(a));
// // //   }

// // //   // Create the polylines for showing the route between two places
// // //   _createPolylines(
// // //     double startLatitude,
// // //     double startLongitude,
// // //     double destinationLatitude,
// // //     double destinationLongitude,
// // //   ) async {
// // //     polylinePoints = PolylinePoints();
// // //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// // //       "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ", // Google Maps API Key
// // //       PointLatLng(startLatitude, startLongitude),
// // //       PointLatLng(destinationLatitude, destinationLongitude),
// // //       travelMode: TravelMode.transit,
// // //     );
// // //     if (result.points.isNotEmpty) {
// // //       result.points.forEach((PointLatLng point) {
// // //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// // //       });
// // //     }
// // //     PolylineId id = PolylineId('poly');
// // //     Polyline polyline = Polyline(
// // //       polylineId: id,
// // //       color: Colors.green,
// // //       points: polylineCoordinates,
// // //       width: 3,
// // //     );
// // //     polylines[id] = polyline;
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     startAddressController.text = _currentAddress;
// // //     _getCurrentLocation();
// // //     _getAddress();
// // //     Timer(Duration(milliseconds: 1000), () => _getAddress());

// // //   }

// // //   polyline() async {
// // //     if (_startAddress != '' && _destinationAddress != '') {
// // //       startAddressFocusNode.unfocus();
// // //       desrinationAddressFocusNode.unfocus();
// // //       setState(() {
// // //         if (markers.isNotEmpty) markers.clear();
// // //         if (polylines.isNotEmpty) polylines.clear();
// // //         // if (polylineCoordinates.isNotEmpty) polylineCoordinates.clear();
// // //         _placeDistance = null;
// // //         lines.add(
// // //           Polyline(
// // //             color: Colors.blue,
// // //             points: [],
// // //             endCap: Cap.squareCap,
// // //             geodesic: false,
// // //             polylineId: PolylineId("line_one"),
// // //           ),
// // //         );
// // //         lines.add(
// // //           Polyline(
// // //             points: [
// // //               LatLng(30.704649, 76.717873),
// // //               LatLng(30.741482, 76.768066)
// // //             ],
// // //             color: Colors.greenAccent,
// // //             polylineId: PolylineId("line_one"),
// // //           ),
// // //         );
// // //       });
// // //       _calculateDistance().then((isCalculated) {
// // //         if (isCalculated) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(
// // //               content: Text('Distance Calculated Sucessfully'),
// // //             ),
// // //           );
// // //         } else {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(
// // //               content: Text('Error Calculating Distance'),
// // //             ),
// // //           );
// // //         }
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     var height = MediaQuery.of(context).size.height;
// // //     var width = MediaQuery.of(context).size.width;
// // //     return Container(
// // //       height: height,
// // //       width: width,
// // //       child: Scaffold(
// // //         key: _scaffoldKey,
// // //         body: Stack(
// // //           children: <Widget>[
// // //             // Map View
// // //             GoogleMap(
// // //               markers: Set<Marker>.from(markers),
// // //               initialCameraPosition: _initialLocation,
// // //               myLocationEnabled: true,
// // //               myLocationButtonEnabled: false,
// // //               mapType: MapType.normal,
// // //               zoomGesturesEnabled: true,
// // //               zoomControlsEnabled: false,
// // //               polylines: Set<Polyline>.of(polylines.values),
// // //               onMapCreated: (GoogleMapController controller) {
// // //                 mapController = controller;
// // //               },
// // //             ),
// // //             // Show zoom buttons
// // //             SafeArea(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.only(left: 10.0),
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: <Widget>[
// // //                     ClipOval(
// // //                       child: Material(
// // //                         color: Colors.blue.shade100, // button color
// // //                         child: InkWell(
// // //                           splashColor: Colors.blue, // inkwell color
// // //                           child: SizedBox(
// // //                             width: 50,
// // //                             height: 50,
// // //                             child: Icon(Icons.add),
// // //                           ),
// // //                           onTap: () {
// // //                             mapController.animateCamera(
// // //                               CameraUpdate.zoomIn(),
// // //                             );
// // //                           },
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     SizedBox(height: 20),
// // //                     ClipOval(
// // //                       child: Material(
// // //                         color: Colors.blue.shade100, // button color
// // //                         child: InkWell(
// // //                           splashColor: Colors.blue, // inkwell color
// // //                           child: SizedBox(
// // //                             width: 50,
// // //                             height: 50,
// // //                             child: Icon(Icons.remove),
// // //                           ),
// // //                           onTap: () {
// // //                             mapController.animateCamera(
// // //                               CameraUpdate.zoomOut(),
// // //                             );
// // //                           },
// // //                         ),
// // //                       ),
// // //                     )
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //             // Show the place input fields & button for
// // //             // showing the route
// // //             SafeArea(
// // //               child: Align(
// // //                 alignment: Alignment.bottomCenter,
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.only(top: 10.0),
// // //                   child: Container(
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.transparent,
// // //                       borderRadius: BorderRadius.all(
// // //                         Radius.circular(20.0),
// // //                       ),
// // //                     ),
// // //                     width: width * 0.9,
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
// // //                       child: Column(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: <Widget>[
// // //                           SizedBox(height: 10),
// // //                           Visibility(
// // //                             visible: _placeDistance == null ? false : true,
// // //                             child: Text(
// // //                               'DISTANCE: $_placeDistance km',
// // //                               style: TextStyle(
// // //                                 fontSize: 16,
// // //                                 fontWeight: FontWeight.bold,
// // //                               ),
// // //                             ),
// // //                           ),
// // //                           SizedBox(height: 5),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             Align(
// // //               alignment: Alignment.bottomRight,
// // //                           child: ElevatedButton(onPressed: (){
// // //                 _getAddress();
// // //               }, child: Text('address')),
// // //             ),
// // //             // Show current location button
// // //             SafeArea(
// // //               child: Align(
// // //                 alignment: Alignment.topRight,
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
// // //                   child: ClipOval(
// // //                     child: Material(
// // //                       color: Colors.orange.shade100, // button color
// // //                       child: InkWell(
// // //                         splashColor: Colors.orange, // inkwell color
// // //                         child: SizedBox(
// // //                           width: 56,
// // //                           height: 56,
// // //                           child: Icon(Icons.my_location),
// // //                         ),
// // //                         onTap: () {
// // //                           mapController.animateCamera(
// // //                             CameraUpdate.newCameraPosition(
// // //                               CameraPosition(
// // //                                 target: LatLng(
// // //                                   _currentPosition.latitude,
// // //                                   _currentPosition.longitude,
// // //                                 ),
// // //                                 zoom: 18.0,
// // //                               ),
// // //                             ),
// // //                           );
// // //                         },
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // import 'dart:async';
// // // import 'dart:math';

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // // import 'package:geocoding/geocoding.dart';
// // // import 'package:geolocator/geolocator.dart';
// // // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // // import 'package:location/location.dart';
// // // // import 'package:location_tracking/google_map_api.dart';

// // // Future<void> main() async {
// // //   // WidgetsFlutterBinding.ensureInitialized();
// // //   runApp(GetLocation());
// // // }

// // // class GetLocation extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Google Map',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: MapView(),
// // //     );
// // //   }
// // // }

// // // class MapView extends StatefulWidget {
// // //   const MapView({Key? key}) : super(key: key);

// // //   @override
// // //   _MapViewState createState() => _MapViewState();
// // // }

// // // class _MapViewState extends State<MapView> {
// // //   LatLng sourceLocation = LatLng(30.697600, 76.692280);
// // //   LatLng destinationLatlng = LatLng(30.688009, 76.702660);
// // //   Map<PolylineId, Polyline> polylines = {};
// // // String? _placeDistance;
// // // String currentAddress='';
// // // String destinationAddress='';

// // //   Set<Marker> _marker = Set<Marker>();

// // //   Set<Polyline> _polylines = Set<Polyline>();
// // //   List<LatLng> polylineCoordinates = [];
// // //   late PolylinePoints polylinePoints;

// // //   late StreamSubscription<LocationData> subscription;
// // //   Completer<GoogleMapController> _controller = Completer();
// // //   LocationData? currentLocation;
// // //   late LocationData destinationLocation;
// // //   late Location location;
// // //   late Position _currentPosition;
// // //   late GoogleMapController mapController;
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // // _calculateDistance();
// // //     location = Location();
// // //     polylinePoints = PolylinePoints();

// // //     subscription = location.onLocationChanged.listen((clocation) {
// // //       currentLocation = clocation;
// // //       var live=currentLocation;
// // //       print(live);
// // //       updatePinsOnMap();
// // //     });

// // //     setInitialLocation();
// // //   }

// // //   void setInitialLocation() async {
// // //     await location.getLocation().then((value) {
// // //       currentLocation = value;
// // //       setState(() {});
// // //     });

// // //     destinationLocation = LocationData.fromMap({
// // //       "latitude": destinationLatlng.latitude,
// // //       "longitude": destinationLatlng.longitude,
// // //     });
// // //   }

// // //   Future<bool> _calculateDistance() async {
// // //     try {
// // //       // Retrieving placemarks from addresses
// // //       var startPlacemark = await locationFromAddress(currentAddress);
// // //       var destinationPlacemark =
// // //           await locationFromAddress(destinationAddress);
// // //       // Use the retrieved coordinates of the current position,
// // //       // instead of the address if the start position is user's
// // //       // current position, as it results in better accuracy.
// // //       double startLatitude = currentAddress == currentAddress
// // //           ? _currentPosition.latitude
// // //           : startPlacemark[0].latitude;
// // //       double startLongitude = currentAddress == currentAddress
// // //           ? _currentPosition.longitude
// // //           : startPlacemark[0].longitude;
// // //       double destinationLatitude = destinationPlacemark[0].latitude;
// // //       double destinationLongitude = destinationPlacemark[0].longitude;
// // //       String startCoordinatesString = '($startLatitude, $startLongitude)';
// // //       String destinationCoordinatesString =
// // //           '($destinationLatitude, $destinationLongitude)';
// // //       // Start Location Marker
// // //       Marker startMarker = Marker(
// // //         markerId: MarkerId(startCoordinatesString),
// // //         position: LatLng(startLatitude, startLongitude),
// // //         infoWindow: InfoWindow(
// // //           title: 'Start $startCoordinatesString',
// // //           snippet: currentAddress,
// // //         ),
// // //         icon: BitmapDescriptor.defaultMarker,
// // //       );
// // //       // Destination Location Marker
// // //       Marker destinationMarker = Marker(
// // //         markerId: MarkerId(destinationCoordinatesString),
// // //         position: LatLng(destinationLatitude, destinationLongitude),
// // //         infoWindow: InfoWindow(
// // //           title: 'Destination $destinationCoordinatesString',
// // //           snippet: destinationAddress,
// // //         ),
// // //         icon: BitmapDescriptor.defaultMarker,
// // //       );
// // //       // Adding the markers to the list
// // //       _marker.add(startMarker);
// // //       _marker.add(destinationMarker);
// // //       print(
// // //         'START COORDINATES: ($startLatitude, $startLongitude)',
// // //       );
// // //       print(
// // //         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
// // //       );
// // //       // Calculating to check that the position relative
// // //       // to the frame, and pan & zoom the camera accordingly.
// // //       double miny = (startLatitude <= destinationLatitude)
// // //           ? startLatitude
// // //           : destinationLatitude;
// // //       double minx = (startLongitude <= destinationLongitude)
// // //           ? startLongitude
// // //           : destinationLongitude;
// // //       double maxy = (startLatitude <= destinationLatitude)
// // //           ? destinationLatitude
// // //           : startLatitude;
// // //       double maxx = (startLongitude <= destinationLongitude)
// // //           ? destinationLongitude
// // //           : startLongitude;
// // //       double southWestLatitude = miny;
// // //       double southWestLongitude = minx;
// // //       double northEastLatitude = maxy;
// // //       double northEastLongitude = maxx;
// // //       // Accommodate the two locations within the
// // //       // camera view of the map
// // //       mapController.animateCamera(
// // //         CameraUpdate.newLatLngBounds(
// // //           LatLngBounds(
// // //             northeast: LatLng(northEastLatitude, northEastLongitude),
// // //             southwest: LatLng(southWestLatitude, southWestLongitude),
// // //           ),
// // //           100.0,
// // //         ),
// // //       );
// // //       // Calculating the distance between the start and the end positions
// // //       // with a straight path, without considering any route
// // //       // double distanceInMeters = await Geolocator.bearingBetween(
// // //       //   startLatitude,
// // //       //   startLongitude,
// // //       //   destinationLongitude,
// // //       // );
// // //       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
// // //           destinationLongitude);
// // //       double totalDistance = 0.0;
// // //       // Calculating the total distance by adding the distance
// // //       // between small segments
// // //       for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// // //         totalDistance += _coordinateDistance(
// // //           polylineCoordinates[i].latitude,
// // //           polylineCoordinates[i].longitude,
// // //           polylineCoordinates[i + 1].latitude,
// // //           polylineCoordinates[i + 1].longitude,
// // //         );
// // //       }
// // //       setState(() {
// // //         _placeDistance = totalDistance.toStringAsFixed(2);
// // //         print('DISTANCE: $_placeDistance km');
// // //       });

// // //       return true;
// // //     } catch (e) {
// // //       print(e);
// // //     }
// // //     return false;
// // //   }
// // //     double _coordinateDistance(lat1, lon1, lat2, lon2) {
// // //     var p = 0.017453292519943295;
// // //     var c = cos;
// // //     var a = 0.5 -
// // //         c((lat2 - lat1) * p) / 2 +
// // //         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
// // //     return 12742 * asin(sqrt(a));
// // //   }
// // //   _createPolylines(
// // //     double startLatitude,
// // //     double startLongitude,
// // //     double destinationLatitude,
// // //     double destinationLongitude,
// // //   ) async {
// // //     polylinePoints = PolylinePoints();
// // //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// // //       "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ", // Google Maps API Key
// // //       PointLatLng(startLatitude, startLongitude),
// // //       PointLatLng(destinationLatitude, destinationLongitude),
// // //       travelMode: TravelMode.transit,
// // //     );
// // //     if (result.points.isNotEmpty) {
// // //       result.points.forEach((PointLatLng point) {
// // //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// // //       });
// // //     }
// // //     PolylineId id = PolylineId('poly');
// // //     Polyline polyline = Polyline(
// // //       polylineId: id,
// // //       color: Colors.green,
// // //       points: polylineCoordinates,
// // //       width: 3,
// // //     );
// // //     polylines[id] = polyline;
// // //   }
// // //   void showLocationPins() {
// // //     var sourceposition = LatLng(
// // //         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

// // //     var destinationPosition =
// // //         LatLng(destinationLatlng.latitude, destinationLatlng.longitude);

// // //     _marker.add(Marker(
// // //       markerId: MarkerId('sourcePosition'),
// // //       position: sourceposition,
// // //     ));

// // //     _marker.add(
// // //       Marker(
// // //         markerId: MarkerId('destinationPosition'),
// // //         position: destinationPosition,
// // //       ),
// // //     );

// // //     setPolylinesInMap();
// // //   }

// // //   void setPolylinesInMap() async {
// // //     var result = await polylinePoints.getRouteBetweenCoordinates(
// // //       "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ",
// // //       PointLatLng(
// // //           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
// // //       PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
// // //     );

// // //     if (result.points.isNotEmpty) {
// // //       result.points.forEach((pointLatLng) {
// // //         polylineCoordinates
// // //             .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
// // //       });
// // //     }

// // //     setState(() {
// // //       _polylines.add(Polyline(
// // //         width: 5,
// // //         polylineId: PolylineId('polyline'),
// // //         color: Colors.blueAccent,
// // //         points: polylineCoordinates,
// // //       ));
// // //     });
// // //   }

// // //   void updatePinsOnMap() async {
// // //     CameraPosition cameraPosition = CameraPosition(
// // //       zoom: 20,
// // //       tilt: 80,
// // //       bearing: 30,
// // //       target: LatLng(
// // //           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
// // //     );

// // //     final GoogleMapController controller = await _controller.future;

// // //     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

// // //     var sourcePosition = LatLng(
// // //         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

// // //     setState(() {
// // //       _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

// // //       _marker.add(Marker(
// // //         markerId: MarkerId('sourcePosition'),
// // //         position: sourcePosition,
// // //       ));
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     CameraPosition initialCameraPosition = CameraPosition(
// // //       zoom: 20,
// // //       tilt: 80,
// // //       bearing: 30,
// // //       target: currentLocation != null
// // //           ? LatLng(currentLocation!.latitude ?? 0.0,
// // //               currentLocation!.longitude ?? 0.0)
// // //           : LatLng(0.0, 0.0),
// // //     );

// // //     return currentLocation == null
// // //         ? Container(
// // //             height: MediaQuery.of(context).size.height,
// // //             width: MediaQuery.of(context).size.width,
// // //             alignment: Alignment.center,
// // //             child: CircularProgressIndicator(),
// // //           )
// // //         : SafeArea(
// // //             child: Scaffold(
// // //               body: GoogleMap(
// // //                 myLocationButtonEnabled: true,
// // //                 compassEnabled: true,
// // //                 markers: _marker,
// // //                 polylines: _polylines,
// // //                 mapType: MapType.normal,
// // //                 initialCameraPosition: initialCameraPosition,
// // //                 onMapCreated: (GoogleMapController controller) {
// // //                   _controller.complete(controller);

// // //                   showLocationPins();
// // //                 },
// // //               ),
// // //             ),
// // //           );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     subscription.cancel();
// // //     super.dispose();
// // //   }
// // // }

// // import 'dart:async';

// // import 'package:demoapp/pages/map/helpalert.dart';
// // import 'package:demoapp/pages/map/map1.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// // import 'package:flutter_switch/flutter_switch.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:geolocator/geolocator.dart';
// // //import 'package:google_map/secrets.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'dart:math' show cos, sqrt, asin;

// // // Future<void> main() async {
// // //   // WidgetsFlutterBinding.ensureInitialized();
// // //   runApp(GetLocation());
// // // }

// // class Accept extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Google Map',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MapView(),
// //     );
// //   }
// // }

// // class MapView extends StatefulWidget {
// //   @override
// //   _MapViewState createState() => _MapViewState();
// // }

// // class _MapViewState extends State<MapView> {
// //   CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
// //   late GoogleMapController mapController;
// //   late Position _currentPosition;
// //   String _currentAddress = '';
// //   final startAddressController = TextEditingController();
// //   final destinationAddressController = TextEditingController();
// //   final startAddressFocusNode = FocusNode();
// //   final desrinationAddressFocusNode = FocusNode();
// //   String _startAddress = '';
// //   String _destinationAddress = '';
// //   String? _placeDistance;
// //   Set<Marker> markers = {};
// //   late PolylinePoints polylinePoints;
// //   Map<PolylineId, Polyline> polylines = {};
// //   Set<Polyline> lines = {};
// //   List<LatLng> polylineCoordinates = [];
// //   final _scaffoldKey = GlobalKey<ScaffoldState>();

// //   // Method for retrieving the current location
// //   _getCurrentLocation() async {
// //     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
// //         .then((Position position) async {
// //       setState(() {
// //         _currentPosition = position;
// //         print('CURRENT POS: $_currentPosition');
// //         mapController.animateCamera(
// //           CameraUpdate.newCameraPosition(
// //             CameraPosition(
// //               target: LatLng(position.latitude, position.longitude),
// //               zoom: 18.0,
// //             ),
// //           ),
// //         );
// //       });
// //       await _getAddress();
// //       print(position.latitude);
// //       print(position.longitude);
// //     }).catchError((e) {
// //       print(e);
// //     });
// //   }

// //   // Method for retrieving the address
// //   _getAddress() async {
// //     // mapController.animateCamera(
// //     //                           CameraUpdate.zoomIn());

// //     try {
// //       List<Placemark> p = await placemarkFromCoordinates(
// //           _currentPosition.latitude, _currentPosition.longitude);
// //       Placemark place = p[0];
// //       setState(() {
// //         _currentAddress =
// //             "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
// //         startAddressController.text = _currentAddress;
// //         _startAddress = _currentAddress;
// //         var liveLocation = _currentAddress;
// //         print(liveLocation);
// //         var destination = "3086, sector 71 Mohali";
// //         print(destination);
// //         _startAddress = liveLocation;
// //         _destinationAddress = destination;
// //         polyline();
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   // Method for calculating the distance between two places
// //   Future<bool> _calculateDistance() async {
// //     try {
// //       // Retrieving placemarks from addresses
// //       List<Location> startPlacemark = await locationFromAddress(_startAddress);
// //       List<Location> destinationPlacemark =
// //           await locationFromAddress(_destinationAddress);
// //       // Use the retrieved coordinates of the current position,
// //       // instead of the address if the start position is user's
// //       // current position, as it results in better accuracy.
// //       double startLatitude = _startAddress == _currentAddress
// //           ? _currentPosition.latitude
// //           : startPlacemark[0].latitude;
// //       double startLongitude = _startAddress == _currentAddress
// //           ? _currentPosition.longitude
// //           : startPlacemark[0].longitude;
// //       double destinationLatitude = destinationPlacemark[0].latitude;
// //       double destinationLongitude = destinationPlacemark[0].longitude;
// //       String startCoordinatesString = '($startLatitude, $startLongitude)';
// //       String destinationCoordinatesString =
// //           '($destinationLatitude, $destinationLongitude)';
// //       // Start Location Marker
// //       Marker startMarker = Marker(
// //         markerId: MarkerId(startCoordinatesString),
// //         position: LatLng(startLatitude, startLongitude),
// //         infoWindow: InfoWindow(
// //           title: 'Start $startCoordinatesString',
// //           snippet: _startAddress,
// //         ),
// //         icon: BitmapDescriptor.defaultMarker,
// //       );
// //       // Destination Location Marker
// //       Marker destinationMarker = Marker(
// //         markerId: MarkerId(destinationCoordinatesString),
// //         position: LatLng(destinationLatitude, destinationLongitude),
// //         infoWindow: InfoWindow(
// //           title: 'Destination $destinationCoordinatesString',
// //           snippet: _destinationAddress,
// //         ),
// //         icon: BitmapDescriptor.defaultMarker,
// //       );
// //       // Adding the markers to the list
// //       markers.add(startMarker);
// //       markers.add(destinationMarker);
// //       print(
// //         'START COORDINATES: ($startLatitude, $startLongitude)',
// //       );
// //       print(
// //         'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
// //       );
// //       // Calculating to check that the position relative
// //       // to the frame, and pan & zoom the camera accordingly.
// //       double miny = (startLatitude <= destinationLatitude)
// //           ? startLatitude
// //           : destinationLatitude;
// //       double minx = (startLongitude <= destinationLongitude)
// //           ? startLongitude
// //           : destinationLongitude;
// //       double maxy = (startLatitude <= destinationLatitude)
// //           ? destinationLatitude
// //           : startLatitude;
// //       double maxx = (startLongitude <= destinationLongitude)
// //           ? destinationLongitude
// //           : startLongitude;
// //       double southWestLatitude = miny;
// //       double southWestLongitude = minx;
// //       double northEastLatitude = maxy;
// //       double northEastLongitude = maxx;
// //       // Accommodate the two locations within the
// //       // camera view of the map
// //       mapController.animateCamera(
// //         CameraUpdate.newLatLngBounds(
// //           LatLngBounds(
// //             northeast: LatLng(northEastLatitude, northEastLongitude),
// //             southwest: LatLng(southWestLatitude, southWestLongitude),
// //           ),
// //           100.0,
// //         ),
// //       );
// //       // Calculating the distance between the start and the end positions
// //       // with a straight path, without considering any route
// //       // double distanceInMeters = await Geolocator.bearingBetween(
// //       //   startLatitude,
// //       //   startLongitude,
// //       //   destinationLongitude,
// //       // );
// //       await _createPolylines(startLatitude, startLongitude, destinationLatitude,
// //           destinationLongitude);
// //       double totalDistance = 0.0;
// //       // Calculating the total distance by adding the distance
// //       // between small segments
// //       for (int i = 0; i < polylineCoordinates.length - 1; i++) {
// //         totalDistance += _coordinateDistance(
// //           polylineCoordinates[i].latitude,
// //           polylineCoordinates[i].longitude,
// //           polylineCoordinates[i + 1].latitude,
// //           polylineCoordinates[i + 1].longitude,
// //         );
// //       }
// //       setState(() {
// //         _placeDistance = totalDistance.toStringAsFixed(2);
// //         print('DISTANCE: $_placeDistance km');
// //       });

// //       return true;
// //     } catch (e) {
// //       print(e);
// //     }
// //     return false;
// //   }
// //   // Formula for calculating distance between two coordinates

// //   double _coordinateDistance(lat1, lon1, lat2, lon2) {
// //     var p = 0.017453292519943295;
// //     var c = cos;
// //     var a = 0.5 -
// //         c((lat2 - lat1) * p) / 2 +
// //         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
// //     return 12742 * asin(sqrt(a));
// //   }

// //   // Create the polylines for showing the route between two places
// //   _createPolylines(
// //     double startLatitude,
// //     double startLongitude,
// //     double destinationLatitude,
// //     double destinationLongitude,
// //   ) async {
// //     polylinePoints = PolylinePoints();
// //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// //       "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ", // Google Maps API Key
// //       PointLatLng(startLatitude, startLongitude),
// //       PointLatLng(destinationLatitude, destinationLongitude),
// //       travelMode: TravelMode.transit,
// //     );
// //     if (result.points.isNotEmpty) {
// //       result.points.forEach((PointLatLng point) {
// //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //       });
// //     }
// //     PolylineId id = PolylineId('poly');
// //     Polyline polyline = Polyline(
// //       polylineId: id,
// //       color: Colors.green,
// //       points: polylineCoordinates,
// //       width: 3,
// //     );
// //     polylines[id] = polyline;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     startAddressController.text = _currentAddress;
// //     _getCurrentLocation();
// //     _getAddress();
// //     Timer(Duration(milliseconds: 1000), () => _getAddress());
// //   }

// //   polyline() async {
// //     if (_startAddress != '' && _destinationAddress != '') {
// //       startAddressFocusNode.unfocus();
// //       desrinationAddressFocusNode.unfocus();
// //       setState(() {
// //         if (markers.isNotEmpty) markers.clear();
// //         if (polylines.isNotEmpty) polylines.clear();
// //         if (polylineCoordinates.isNotEmpty) polylineCoordinates.clear();
// //         _placeDistance = null;
// //         lines.add(
// //           Polyline(
// //             color: Colors.blue,
// //             points: [],
// //             endCap: Cap.squareCap,
// //             geodesic: false,
// //             polylineId: PolylineId("line_one"),
// //           ),
// //         );
// //         lines.add(
// //           Polyline(
// //             points: [
// //               LatLng(30.704649, 76.717873),
// //               LatLng(30.741482, 76.768066)
// //             ],
// //             color: Colors.greenAccent,
// //             polylineId: PolylineId("line_one"),
// //           ),
// //         );
// //       });
// //       _calculateDistance().then((isCalculated) {
// //         if (isCalculated) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text('Distance Calculated Sucessfully'),
// //             ),
// //           );
// //         } else {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               content: Text('Error Calculating Distance'),
// //             ),
// //           );
// //         }
// //       });
// //     }
// //   }

// //   bool status = false;
// //   MapType _currentMapType = MapType.normal;
// //   void _toggleMapType() {
// //     setState(() {
// //       _currentMapType = (_currentMapType == MapType.normal)
// //           ? MapType.satellite
// //           : MapType.normal;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var height = MediaQuery.of(context).size.height;
// //     var width = MediaQuery.of(context).size.width;
// //     return Container(
// //       height: height,
// //       width: width,
// //       child: Scaffold(
// //         key: _scaffoldKey,
// //         appBar: AppBar(
// //           title: Text(
// //             'Accept or Decline',
// //             style: TextStyle(color: Colors.black, fontSize: 15),
// //           ),
// //           backgroundColor: Colors.transparent,
// //           elevation: 0.0,
// //           centerTitle: true,
// //           leading: IconButton(
// //             icon: Image.asset('assets/images/Layer 1.png'),
// //             onPressed: () => {
// //               Navigator.push(context,
// //                   MaterialPageRoute(builder: (context) => GetLocation()))
// //             },
// //           ),
// //           // elevation: 0,
// //           actions: [
// //             Builder(
// //               builder: (context) => TextButton(
// //                 child: Text(
// //                   'HELP',
// //                   style:
// //                       TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
// //                 ),
// //                 onPressed: () async {
// //                   showDialog(
// //                     context: context,
// //                     builder: (_) => (Help()),
// //                   );
// //                 },
// //               ),
// //             )
// //           ],
// //         ),
// //         body: Stack(
// //           children: <Widget>[
// //             // Map View
// //             GoogleMap(
// //               markers: Set<Marker>.from(markers),
// //               initialCameraPosition: _initialLocation,
// //               myLocationEnabled: true,
// //               myLocationButtonEnabled: false,
// //               mapType: MapType.normal,
// //               zoomGesturesEnabled: true,
// //               zoomControlsEnabled: false,
// //               polylines: Set<Polyline>.of(polylines.values),
// //               onMapCreated: (GoogleMapController controller) {
// //                 mapController = controller;
// //               },
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 500, right: 200),
// //               child: FlutterSwitch(
// //                 activeTextColor: Colors.transparent,
// //                 inactiveTextColor: Colors.transparent,
// //                 width: 50.0,
// //                 height: 30.0,
// //                 value: status,
// //                 borderRadius: 30.0,
// //                 padding: 1.0,
// //                 activeColor: Color(0xFFfdbc35),
// //                 showOnOff: true,
// //                 onToggle: (val) {
// //                   setState(() {
// //                     status = val;
// //                     _toggleMapType();
// //                   });
// //                 },
// //               ),
// //             ),
// //             // Show zoom buttons
// //             SafeArea(
// //               child: Padding(
// //                 padding: const EdgeInsets.only(left: 10.0),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: <Widget>[
// //                     ClipOval(
// //                       child: Material(
// //                         color: Colors.blue.shade100, // button color
// //                         child: InkWell(
// //                           splashColor: Colors.blue, // inkwell color
// //                           child: SizedBox(
// //                             width: 50,
// //                             height: 50,
// //                             child: Icon(Icons.add),
// //                           ),
// //                           onTap: () {
// //                             mapController.animateCamera(
// //                               CameraUpdate.zoomIn(),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20),
// //                     ClipOval(
// //                       child: Material(
// //                         color: Colors.blue.shade100, // button color
// //                         child: InkWell(
// //                           splashColor: Colors.blue, // inkwell color
// //                           child: SizedBox(
// //                             width: 50,
// //                             height: 50,
// //                             child: Icon(Icons.remove),
// //                           ),
// //                           onTap: () {
// //                             mapController.animateCamera(
// //                               CameraUpdate.zoomOut(),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             // Show the place input fields & button for
// //             // showing the route
// //             SafeArea(
// //               child: Align(
// //                 alignment: Alignment.bottomCenter,
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(top: 10.0),
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.transparent,
// //                       borderRadius: BorderRadius.all(
// //                         Radius.circular(20.0),
// //                       ),
// //                     ),
// //                     width: width * 0.9,
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: <Widget>[
// //                           SizedBox(height: 10),
// //                           Visibility(
// //                             visible: _placeDistance == null ? false : true,
// //                             child: Text(
// //                               'DISTANCE: $_placeDistance km',
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(height: 5),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             // Show current location button
// //             SafeArea(
// //               child: Align(
// //                 alignment: Alignment.topRight,
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
// //                   child: ClipOval(
// //                     child: Material(
// //                       color: Colors.orange.shade100, // button color
// //                       child: InkWell(
// //                         splashColor: Colors.orange, // inkwell color
// //                         child: SizedBox(
// //                           width: 56,
// //                           height: 56,
// //                           child: Icon(Icons.my_location),
// //                         ),
// //                         onTap: () {
// //                           mapController.animateCamera(
// //                             CameraUpdate.newCameraPosition(
// //                               CameraPosition(
// //                                 target: LatLng(
// //                                   _currentPosition.latitude,
// //                                   _currentPosition.longitude,
// //                                 ),
// //                                 zoom: 18.0,
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:demoapp/pages/map/helpalert.dart';
// import 'dart:async';
// import 'dart:math';
// import 'package:demoapp/pages/map/map1.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';



// Future<void> main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   runApp(GetData());
// }

// class GetData extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Map',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MapView(),
//     );
//   }
// }

// class MapView extends StatefulWidget {
//   const MapView({Key? key}) : super(key: key);

//   @override
//   _MapViewState createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   String origin="";
//   String destination='';
// String distance='';
//   String duration='';
//   bool status = false;
//   MapType _currentMapType = MapType.normal;
//   void _toggleMapType() {
//     setState(() {
//       _currentMapType = (_currentMapType == MapType.normal)
//           ? MapType.satellite
//           : MapType.normal;
//     });
//   }

//   LatLng sourceLocation = LatLng(30.697600, 76.692280);
//   LatLng destinationLatlng = LatLng(30.704649, 76.717873);

//   Future checkDistance() async {
//     Dio dio = new Dio();
//     Response response = await dio.get(
//         "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=30.697600,76.692280&destinations=30.704649,76.717873&key=AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ");
//     print(response.data['destination_addresses'][0]);
//     // final distancedata = response.data;
//      origin = response.data['origin_addresses'][0];
//      destination=response.data['destination_addresses'][0];
//      distance=response.data['rows'][0]['elements'][0]['distance']['text'];
//      duration=response.data['rows'][0]['elements'][0]['duration']['text'];
//    print('.......................................');
//   }

  

//   Set<Marker> _marker = Set<Marker>();

//   Set<Polyline> _polylines = Set<Polyline>();
//   List<LatLng> polylineCoordinates = [];
//   late PolylinePoints polylinePoints;

//   late StreamSubscription<LocationData> subscription;
//   Completer<GoogleMapController> _controller = Completer();
//   LocationData? currentLocation;
//   late LocationData destinationLocation;
//   late Location location;

//   @override
//   void initState() {
//     super.initState();
//     _calculate();
//     checkDistance();
//     // traveltime = time();
//     location = Location();
//     polylinePoints = PolylinePoints();

//     subscription = location.onLocationChanged.listen((clocation) {
//       currentLocation = clocation;
//       var live = currentLocation;
//       print(live);
//       updatePinsOnMap();
//     });

//     setInitialLocation();
//   }

//   void setInitialLocation() async {
//     await location.getLocation().then((value) {
//       currentLocation = value;
//       setState(() {});
//     });

//     destinationLocation = LocationData.fromMap({
//       "latitude": destinationLatlng.latitude,
//       "longitude": destinationLatlng.longitude,
//     });
//   }

//   String? _placeDistance;
//   showLocationPins() async {
//     var sourceposition = LatLng(
//         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

//     var destinationPosition =
//         LatLng(destinationLatlng.latitude, destinationLatlng.longitude);

//     _marker.add(Marker(
//       markerId: MarkerId('sourcePosition'),
//       position: sourceposition,
//     ));

//     _marker.add(
//       Marker(
//         markerId: MarkerId('destinationPosition'),
//         position: destinationPosition,
//       ),
//     );

//     await setPolylinesInMap();
//     double totalDistance = 0.0;
//     // Calculating the total distance by adding the distance
//     // between small segments
//     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//       totalDistance += _coordinateDistance(
//         polylineCoordinates[i].latitude,
//         polylineCoordinates[i].longitude,
//         polylineCoordinates[i + 1].latitude,
//         polylineCoordinates[i + 1].longitude,
//       );
//     }
//     setState(() {
//       _placeDistance = totalDistance.toStringAsFixed(2);
//       print('DISTANCE: $_placeDistance km');
//     });

//     // setPolylinesInMap();
//   }

//   double _coordinateDistance(lat1, lon1, lat2, lon2) {
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 -
//         c((lat2 - lat1) * p) / 2 +
//         c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//     return 12742 * asin(sqrt(a));
//   }

//   _calculate() {
//     double totalDistance = 0.0;
//     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//       totalDistance += _coordinateDistance(
//         polylineCoordinates[i].latitude,
//         polylineCoordinates[i].longitude,
//         polylineCoordinates[i + 1].latitude,
//         polylineCoordinates[i + 1].longitude,
//       );
//     }
//     setState(() {
//       _placeDistance = totalDistance.toStringAsFixed(2);
//       print('DISTANCE: $_placeDistance km');
//     });

//     return true;
//   }

//   setPolylinesInMap() async {
//     var result = await polylinePoints.getRouteBetweenCoordinates(
//       "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ",
//       PointLatLng(
//           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
//       PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
//     );

//     if (result.points.isNotEmpty) {
//       result.points.forEach((pointLatLng) {
//         polylineCoordinates
//             .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
//       });
//     }

//     setState(() {
//       _polylines.add(Polyline(
//         width: 5,
//         polylineId: PolylineId('polyline'),
//         color: Colors.blueAccent,
//         points: polylineCoordinates,
//       ));
//       print(polylineCoordinates);
//       print("polylineCoordinates");
//     });
//   }

//   void updatePinsOnMap() async {
//     CameraPosition cameraPosition = CameraPosition(
//       zoom: 20,
//       tilt: 80,
//       bearing: 30,
//       target: LatLng(
//           currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
//     );

//     final GoogleMapController controller = await _controller.future;

//     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

//     var sourcePosition = LatLng(
//         currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

//     setState(() {
//       _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

//       _marker.add(Marker(
//         markerId: MarkerId('sourcePosition'),
//         position: sourcePosition,
//       ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(distance);
//     print("distance....................................");

//     CameraPosition initialCameraPosition = CameraPosition(
//       zoom: 20,
//       tilt: 80,
//       bearing: 30,
//       target: currentLocation != null
//           ? LatLng(currentLocation!.latitude ?? 0.0,
//               currentLocation!.longitude ?? 0.0)
//           : LatLng(0.0, 0.0),
//     );

//     return currentLocation == null
//         ? Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             alignment: Alignment.center,
//             child: CircularProgressIndicator(),
//           )
//         : SafeArea(
//             child: Scaffold(
//               appBar: AppBar(
//                 title: Text(
//                   'Accept or Decline',
//                   style: TextStyle(color: Colors.black, fontSize: 15),
//                 ),
//                 backgroundColor: Colors.transparent,
//                 elevation: 0.0,
//                 centerTitle: true,
//                 leading: IconButton(
//                   icon: Image.asset('assets/images/Layer 1.png'),
//                   onPressed: () => {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => GetLocation()))
//                   },
//                 ),
//                 // elevation: 0,
//                 actions: [
//                   Builder(
//                     builder: (context) => TextButton(
//                       child: Text(
//                         'HELP',
//                         style: TextStyle(
//                             color: Colors.red, fontWeight: FontWeight.bold),
//                       ),
//                       onPressed: () async {
//                         showDialog(
//                           context: context,
//                           builder: (_) => (Help()),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               body: Stack(
//                 children: [
//                   GoogleMap(
//                     myLocationButtonEnabled: true,
//                     compassEnabled: true,
//                     markers: _marker,
//                     polylines: _polylines,
//                     mapType: MapType.normal,
//                     initialCameraPosition: initialCameraPosition,
//                     onMapCreated: (GoogleMapController controller) {
//                       _controller.complete(controller);

//                       showLocationPins();
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 500, right: 200),
//                     child: FlutterSwitch(
//                       activeTextColor: Colors.transparent,
//                       inactiveTextColor: Colors.transparent,
//                       width: 50.0,
//                       height: 30.0,
//                       value: status,
//                       borderRadius: 30.0,
//                       padding: 1.0,
//                       activeColor: Color(0xFFfdbc35),
//                       showOnOff: true,
//                       onToggle: (val) {
//                         setState(() {
//                           status = val;
//                           _toggleMapType();
//                         });
//                       },
//                     ),
//                   ),
//                   // Align(
//                   //   alignment: Alignment.topCenter,
//                   //   child: Text('title'+title)),
//                   // Align(
//                   //   alignment: Alignment.topCenter,
//                   //   child: Container(
//                   //     child: FutureBuilder(
//                   //       future: checkDistance(),
//                   //       builder: (context, snapshot) {
//                   //         if (snapshot.hasData) {
//                   //           return Column(
//                   //             children: [
//                   //               Text(duration),
//                   //               Text(distance),
//                   //               // Text(
//                   //               //   'Expected Time: ' + snapshot.data!.toString(),
//                   //               //   style: TextStyle(color: Colors.black),
//                   //               // ),
//                   //               Text(
//                   //                 "Distance: $_placeDistance km",
//                   //                 style: TextStyle(color: Colors.white),
//                   //               ),
//                   //             ],
//                   //           );
//                   //         } else if (snapshot.hasError) {
//                   //           return Text('${snapshot.error}');
//                   //         }

//                   //         // By default, show a loading spinner.
//                   //         return const CircularProgressIndicator();
//                   //       },
//                   //     ),
//                   //   ),
//                   // ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                                       child: Column(
//                                         children: [
//                                           Text(distance)
//                                         ],
//                                       ),
//                   )
//                 ],
//               ),
//             ),
//           );
//   }

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
// }
