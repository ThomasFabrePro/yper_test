import 'package:yper_test/models/delivery_hour.dart';

class Shop {
  //?Name non demandé ?
  String name;

  //address
  String city;
  String street;
  String zip;
  String publicPhone;

  List<DeliveryHour> deliveryHours;

  get fullAddress => "$street, $zip $city";

  Shop({
    required this.name,
    required this.city,
    required this.street,
    required this.zip,
    required this.publicPhone,
    required this.deliveryHours,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    List<DeliveryHour> deliveryHours = [];
    for (var deliveryHour in json['delivery_hours']) {
      deliveryHours.add(DeliveryHour.fromJson(deliveryHour));
    }
    //Réorganisation de la liste pour qu'elle soit dans l'ordre des jours de la semaine
    //Pour faciliter le traitement suivant
    deliveryHours.sort((a, b) => a.day.compareTo(b.day));
    //remplissage avec les jours manquants qui sont comptés comme fermés
    if (deliveryHours.length < 7) {
      for (var i = 1; i < 8; i++) {
        if (deliveryHours.indexWhere((element) => element.day == i) == -1) {
          deliveryHours.add(
            DeliveryHour(
              day: i,
              open: "00:00:00",
              close: "00:00:00",
              isClosed: true,
            ),
          );
        }
      }
    }
    return Shop(
      name: json['name'],
      city: json["address"]['city'],
      street: json["address"]['street'],
      zip: json["address"]['zip'],
      publicPhone:
          json['phone']['public'] ?? 'Aucun numéro de téléphone disponible',
      deliveryHours: deliveryHours,
    );
  }
}
