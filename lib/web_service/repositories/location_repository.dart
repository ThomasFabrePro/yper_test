import 'dart:convert';
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
        return data;
      }
    } catch (e) {
      throw Exception(
          'Erreur lors de la requête de récupération des prédictions : $e');
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
        return (lat, lng);
      }
    } catch (e) {
      throw Exception(
          'Erreur lors de la requête de récupération des coordonnées : $e');
    }
    return (lat, lng);
  }

  Future<Map<String, dynamic>> getNearestYperShops(
      {required double lat, required double lng}) async {
    int maximumShopsReturned = 10;
    int maximumRadiusInMeters = 30000;
    Map<String, dynamic> data = {};
    try {
      Uri uri = Uri.https("io.beta.yper.org", "retailpoint/search", {
        "location": "$lat,$lng",
        "limit": "$maximumShopsReturned",
        "max_distance": "$maximumRadiusInMeters"
      });
      var response = await http.get(uri, headers: {
        "Authorization": yperApiToken,
        "X-Request-Timestamp": "${DateTime.now().millisecondsSinceEpoch}",
      });
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      throw Exception(
          'Erreur lors de la requête de récupération des magasins proches : $e');
    }
    return data;
  }
}
