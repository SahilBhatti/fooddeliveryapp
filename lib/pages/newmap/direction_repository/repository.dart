import 'package:demoapp/pages/newmap/direction_modal/direction_modal.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_gmaps/.env.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_gmaps/.env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio ?dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': 'AIzaSyBTzw9b9M9ZgxFyxp30bqGoOz6Kn2K_6bQ',
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      // return Directions.fromMap(response.data);
      // return Directions.fromMap(response.data);
    }
    return response.data;
  }
}
