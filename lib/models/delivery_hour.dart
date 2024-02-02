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
    return DeliveryHour(
      day: json['day'],
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
