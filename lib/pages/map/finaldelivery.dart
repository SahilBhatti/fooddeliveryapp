import 'package:demoapp/pages/map/confirm/confirm_delivery.dart';
import 'package:demoapp/pages/map/helpalert.dart';
import 'dart:async';
import 'dart:math';
import 'package:demoapp/pages/map/map1.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';



Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(FinalDelivery());
}

class FinalDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String origin="";
  String destination='';
String distance='';
  String duration='';
  bool status = false;
  MapType _currentMapType = MapType.normal;
  void _toggleMapType() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.satellite
          : MapType.normal;
    });
  }

  LatLng sourceLocation = LatLng(30.697600, 76.692280);
  LatLng destinationLatlng = LatLng(30.704649, 76.717873);

  Future checkDistance() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=30.697600,76.692280&destinations=30.704649,76.717873&key=AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ");
    print(response.data['destination_addresses'][0]);
    // final distancedata = response.data;
     origin = response.data['origin_addresses'][0];
     destination=response.data['destination_addresses'][0];
     distance=response.data['rows'][0]['elements'][0]['distance']['text'];
     duration=response.data['rows'][0]['elements'][0]['duration']['text'];
   print('.......................................');
  }

  

  Set<Marker> _marker = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;
  Completer<GoogleMapController> _controller = Completer();
  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  @override
  void initState() {
    super.initState();
    _calculate();
    checkDistance();
    Timer(Duration(milliseconds: 10000), () => navigate());
    // traveltime = time();
    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;
      var live = currentLocation;
      print(live);
      updatePinsOnMap();
    });

    setInitialLocation();
  }

  navigate(){
  setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Confirm()));
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
            builder: (BuildContext context,
                    StateSetter setState /*You can rename this!*/) =>
                Modal2());
      },
    );
  });
        
    }

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });

    destinationLocation = LocationData.fromMap({
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
    });
  }

  String? _placeDistance;
  showLocationPins() async {
    var sourceposition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    var destinationPosition =
        LatLng(destinationLatlng.latitude, destinationLatlng.longitude);

    _marker.add(Marker(
      markerId: MarkerId('sourcePosition'),
      position: sourceposition,
    ));

    _marker.add(
      Marker(
        markerId: MarkerId('destinationPosition'),
        position: destinationPosition,
      ),
    );

    await setPolylinesInMap();
    double totalDistance = 0.0;
    // Calculating the total distance by adding the distance
    // between small segments
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    setState(() {
      _placeDistance = totalDistance.toStringAsFixed(2);
      print('DISTANCE: $_placeDistance km');
    });

    // setPolylinesInMap();
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _calculate() {
    double totalDistance = 0.0;
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }
    setState(() {
      _placeDistance = totalDistance.toStringAsFixed(2);
      print('DISTANCE: $_placeDistance km');
    });

    return true;
  }

  setPolylinesInMap() async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDLdAEq-U9bDQdIkPGl9AXCELyly7Q9EnQ",
      PointLatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
      PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    setState(() {
      _polylines.add(Polyline(
        width: 5,
        polylineId: PolylineId('polyline'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
      ));
      print(polylineCoordinates);
      print("polylineCoordinates");
    });
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

      _marker.add(Marker(
        markerId: MarkerId('sourcePosition'),
        position: sourcePosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {

    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : LatLng(0.0, 0.0),
    );

    return currentLocation == null
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Final Delivery',
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
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: true,
                    compassEnabled: true,
                    markers: _marker,
                    polylines: _polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                      showLocationPins();
                    },
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

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
