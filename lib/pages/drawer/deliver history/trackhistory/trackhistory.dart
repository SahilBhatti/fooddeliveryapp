import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(TrackingOrderHistory());

class TrackingOrderHistory extends StatefulWidget {
  @override
  _TrackingOrderHistoryState createState() => _TrackingOrderHistoryState();
}

class _TrackingOrderHistoryState extends State<TrackingOrderHistory> {
  Set<Polyline> lines = {};

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.704649, 76.717873),
    zoom: 13
  );

  @override
  void initState() {
    super.initState();
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
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Maps Polylines',
      home: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          // polygons: myPolygon(),
          trafficEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          polylines: lines,
        ),
      ),
    );
  }
}