import 'package:flutter/material.dart' show debugPrint;
import 'package:http/http.dart' as http;

class LocationRepository {
  Future<dynamic> fetchLocations(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      var response = await http.get(uri, headers: headers);
      debugPrint('response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint("response body: ${response.body}");
      }

      return response;
    } catch (e) {
      debugPrint("$e");
    }
  }
}
