import 'dart:convert';
import 'package:flutter/material.dart' show debugPrint;
import 'package:http/http.dart' as http;

class LocationRepository {
  Future<Map<String, dynamic>> fetchLocations(Uri uri,
      {Map<String, String>? headers}) async {
    Map<String, dynamic> data = {};
    try {
      debugPrint("uri: $uri");
      var response = await http.get(uri, headers: headers);
      debugPrint('response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        debugPrint("response body: ${response.body}");
      }
    } catch (e) {
      debugPrint("$e");
    }
    return data;
  }
}
