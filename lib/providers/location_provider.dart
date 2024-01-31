import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/web_service/repositories/location_repository.dart';

class LocationProvider extends ChangeNotifier {
  final LocationRepository _locationRepository = LocationRepository();
  int _locationId = 0;
  int get locationId => _locationId;

  void setLocationId(int locationId) {
    _locationId = locationId;
    notifyListeners();
  }

  void placeAutoComplete(String query) {
    Uri uri =
        Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
      'input': query,
      'key': googleAutoCompleteApiKey,
      //!ajouter une locationrestriction pour récupérer les résultats uniquement en France
    });
    _locationRepository.fetchLocations(uri);
  }
}
