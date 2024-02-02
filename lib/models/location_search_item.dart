class LocationSearchIitem {
  final String title;
  final String placeId;

  LocationSearchIitem({
    this.title = 'none',
    this.placeId = '',
  });

  factory LocationSearchIitem.fromJson(Map<String, dynamic> json) {
    return LocationSearchIitem(
      title: json['description'],
      placeId: json['place_id'],
    );
  }
}
