import 'package:dio/dio.dart';

class public {
  public({
    this.movie,
  });

  List<Films> movie;

  factory public.fromJson(Map<String, dynamic> json) => public(
    movie: List<Films>.from(json["movie"].map((x) => Films.fromJson(x))),
  );


}

class Films {
  Films({
    this.imageUrl,
    this.title,
    this.categories,
    this.year,
    this.country,
    this.length,
    this.description,
    this.screenshots,
    this.video_trailer,
  });

  String imageUrl;
  String title;
  String categories;
  int year;
  String country;
  int length;
  String description;
  List<String> screenshots;
  String video_trailer;

  factory Films.fromJson(Map<String, dynamic> json) => Films(
    imageUrl: json["imageUrl"],
    title: json["title"],
    categories: json["categories"],
    year: json["year"],
    country: json["country"],
    length: json["length"],
    description: json["description"],
    screenshots: List<String>.from(json["screenshots"].map((x) => x)),
    video_trailer: json['video_trailer'],
  );
}

class DioClient {
  final Dio _dio = Dio(
      BaseOptions(
        contentType: "application/json",
        responseType: ResponseType.json,
      )
  );

  Future<public> getDatas() async {
    Response data = await _dio.get(
        'https://api.npoint.io/759d539383eb07b45e39');
    return public.fromJson(data.data);
  }
}
