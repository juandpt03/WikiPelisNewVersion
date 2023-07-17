// To parse this JSON data, do
//
//     final personMoviesModel = personMoviesModelFromJson(jsonString);

import 'dart:convert';

PersonMoviesModel personMoviesModelFromJson(String str) =>
    PersonMoviesModel.fromJson(json.decode(str));

class PersonMoviesModel {
  final List<Cast> cast;
  final List<Cast> crew;
  final int id;

  PersonMoviesModel({
    required this.cast,
    required this.crew,
    required this.id,
  });

  factory PersonMoviesModel.fromJson(Map<String, dynamic> json) =>
      PersonMoviesModel(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
        id: json["id"],
      );
}

class Cast {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String? character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  Cast({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '',
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"]!,
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"] != null &&
                json["release_date"].toString().isNotEmpty
            ? DateTime.parse(json["release_date"])
            : null,
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"] ?? '',
        job: json["job"] ?? '',
      );
}
