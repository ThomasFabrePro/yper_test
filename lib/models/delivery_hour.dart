class DeliveryHour {
  final int day;
  final String open;
  final String close;

  DeliveryHour({
    required this.day,
    required this.open,
    required this.close,
  });

  factory DeliveryHour.fromJson(Map<String, dynamic> json) {
    return DeliveryHour(
      day: json['day'],
      open: json["hours"]['start'],
      close: json["hours"]['end'],
    );
  }

  String get deliveryHours {
    String start = open.substring(11, 16).replaceAll(":", "h");
    String end = close.substring(11, 16).replaceAll(":", "h");
    return "$start - $end";
  }
}
