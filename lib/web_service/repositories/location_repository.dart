import 'dart:convert';
import 'package:flutter/material.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'package:yper_test/constants.dart';

class LocationRepository {
  Future<Map<String, dynamic>> getLocations(Uri uri,
      {Map<String, String>? headers}) async {
    Map<String, dynamic> data = {};
    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return data;
  }

  Future<(double, double)> getLocationCoordinatesFromPlaceId(
      String placeId) async {
    double lat = 0;
    double lng = 0;
    try {
      Uri uri =
          Uri.https('maps.googleapis.com', 'maps/api/place/details/json', {
        'place_id': placeId,
        'key': googleAutoCompleteApiKey,
      });
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        lat = data['result']['geometry']['location']['lat'];
        lng = data['result']['geometry']['location']['lng'];
      }
    } catch (e) {
      debugPrint("$e");
    }
    debugPrint("TESTA lat: $lat, lng: $lng");
    return (lat, lng);
  }
}
