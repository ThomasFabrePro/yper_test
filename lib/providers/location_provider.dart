import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/models/location_search_item.dart';
import 'package:yper_test/models/shop.dart';
import 'package:yper_test/web_service/repositories/location_repository.dart';

class LocationProvider extends ChangeNotifier {
  //?potentielle inversion de dépendance avec le répo si évolution de l'app
  final LocationRepository _locationRepository = LocationRepository();
  List<LocationSearchIitem> predictions = [];
  List<Shop> nearestYperShops = [];

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

  Future<(double, double)> _retrieveCoordinates(String placeName) async {
    String placeId =
        predictions.firstWhere((element) => element.title == placeName).placeId;
    (double lat, double lng) coordinates =
        await _locationRepository.getLocationCoordinatesFromPlaceId(placeId);
    return coordinates;
  }

  void fetchNearestYperShops(String placeName) async {
    //Récupération des coordonnées du lieu demandé
    (double lat, double lng) coordinates =
        await _retrieveCoordinates(placeName);
    //Récupération des magasins les plus proches
    Map<String, dynamic> yperShops = await _locationRepository
        .getNearestYperShops(lat: coordinates.$1, lng: coordinates.$2);
    //Remplissage de la liste de magasins
    _fillShopsList(yperShops);
    //Netoyage de la liste des prédictions pour supprimer son affichage
    predictions = [];
    notifyListeners();
  }

  void _fillShopsList(Map<String, dynamic> yperShops) {
    //nettoyage puis remplissage de la liste
    nearestYperShops = [];
    for (var shop in yperShops['result']) {
      nearestYperShops.add(Shop.fromJson(shop));
    }
  }
}
