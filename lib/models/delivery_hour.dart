class DeliveryHour {
  final int day;
  final String open;
  final String close;
  final bool isClosed;

  DeliveryHour({
    required this.day,
    required this.open,
    required this.close,
    this.isClosed = false,
  });

  factory DeliveryHour.fromJson(Map<String, dynamic> json) {
    //conversion pour les jours retournés en type double (arrive quand on cherche un code postal)
    int day =
        json['day'] is int ? json['day'] : int.tryParse("${json['day']}") ?? 1;

    return DeliveryHour(
      day: day,
      open: json["hours"]['start'],
      close: json["hours"]['end'],
    );
  }

  String get deliveryHours {
    if (isClosed) {
      return "Fermé";
    }
    String start = open.substring(11, 16).replaceAll(":", "h");
    String end = close.substring(11, 16).replaceAll(":", "h");
    return "$start - $end";
  }

  bool isOpenNow(DateTime now) {
    //!Bonus
    if (isClosed) return false;
    //!triche : besoin de refacto les dates car elles elles sont mauvaises sur l'api
    String nowToString = now.toString();
    String refactoredOpenTime =
        nowToString.substring(0, 11) + open.substring(11, 16);
    String refactoredCloseTime =
        nowToString.substring(0, 11) + close.substring(11, 16);
    DateTime openTime = DateTime.parse(refactoredOpenTime);
    DateTime closeTime = DateTime.parse(refactoredCloseTime);
    if (now.isAfter(openTime) && now.isBefore(closeTime)) {
      return true;
    }
    return false;
  }

  String get dayName {
    switch (day) {
      case 1:
        return "Lundi";
      case 2:
        return "Mardi";
      case 3:
        return "Mercredi";
      case 4:
        return "Jeudi";
      case 5:
        return "Vendredi";
      case 6:
        return "Samedi";
      case 7:
        return "Dimanche";
      default:
        return "Jour inconnu";
    }
  }
}
