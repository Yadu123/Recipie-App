class Recipie {
  final String name;
  final String images;
  final String totaltime;
  final double rating;

  Recipie(
      {required this.name,
      required this.images,
      required this.totaltime,
      required this.rating});

  factory Recipie.fromJson(dynamic json) {
    return Recipie(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        totaltime: json['totaltime'] as String,
        rating: json['rating'] as double);
  }
  static List<Recipie> recipiesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipie.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipie{name: $name, image: $images, rating:$rating,totaltime:$totaltime}';
  }
}
