class LocationSearchIitem {
  final String title;

  LocationSearchIitem({
    this.title = 'none',
  });

  factory LocationSearchIitem.fromJson(Map<String, dynamic> json) {
    return LocationSearchIitem(
      title: json['description'],
    );
  }
}
