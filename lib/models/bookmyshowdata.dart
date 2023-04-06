import 'dart:convert';

BookMyShowData moviesFromJson(String str) =>
    BookMyShowData.fromJson(json.decode(str));
String moviesToJson(BookMyShowData data) => json.encode(data.toJson());

class BookMyShowData {
  BookMyShowData({
    required this.movies,
  });

  List<Movies> movies;

  factory BookMyShowData.fromJson(Map<String, dynamic> json) => BookMyShowData(
        movies:
            List<Movies>.from(json["movies"].map((x) => Movies.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
      };
}

class Movies {
  Movies({
    required this.id,
    required this.imagePath,
    required this.mName,
    required this.time,
    required this.genre,
    required this.rated,
    required this.lang,
    required this.discription,
  });

  int? id;
  String? imagePath;
  String? mName;
  String? time;
  String? genre;
  String? rated;
  String? lang;
  String? discription;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        id: json["id"],
        imagePath: json["imagePath"],
        mName: json["mName"],
        time: json["time"],
        genre: json["genre"],
        rated: json["Rated"],
        lang: json["lang"],
        discription: json["discription"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
        "mName": mName,
        "time": time,
        "genre": genre,
        "Rated": rated,
        "lang": lang,
        "discription": discription,
      };
}
