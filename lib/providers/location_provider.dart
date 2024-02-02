import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/models/location_search_item.dart';
import 'package:yper_test/web_service/repositories/location_repository.dart';

class LocationProvider extends ChangeNotifier {
  final LocationRepository _locationRepository = LocationRepository();
  List<LocationSearchIitem> predictions = [];

  List<String> get predictionsTitles {
    List<String> predictionsTitle = [];
    for (var prediction in predictions) {
      predictionsTitle.add(prediction.title);
    }
    return predictionsTitle;
  }

  void placeAutoComplete(String query) async {
    Uri uri =
        Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
      'input': query,
      'key': googleAutoCompleteApiKey,
      //!ajouter une locationrestriction pour récupérer les résultats uniquement en France
    });
    Map<String, dynamic> predictedLocations =
        await _locationRepository.getLocations(uri);
    if (predictedLocations.isNotEmpty) {
      predictions = [];
      for (var prediction in predictedLocations['predictions']) {
        predictions.add(LocationSearchIitem.fromJson(prediction));
      }
      notifyListeners();
    }
  }

  Future<(double, double)> retrieveCoordinates(String placeName) async {
    String placeId =
        predictions.firstWhere((element) => element.title == placeName).placeId;
    (double lat, double lng) coordinates =
        await _locationRepository.getLocationCoordinatesFromPlaceId(placeId);
    return coordinates;
  }
}
