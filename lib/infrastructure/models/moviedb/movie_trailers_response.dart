// To parse this JSON data, do
//
//     final movieTrailers = movieTrailersFromJson(jsonString);

import 'dart:convert';

MovieTrailersModel movieTrailersFromJson(String str) =>
    MovieTrailersModel.fromJson(json.decode(str));

String movieTrailersToJson(MovieTrailersModel data) =>
    json.encode(data.toJson());

class MovieTrailersModel {
  final int id;
  final List<VideoInfoModel> results;

  MovieTrailersModel({
    required this.id,
    required this.results,
  });

  factory MovieTrailersModel.fromJson(Map<String, dynamic> json) =>
      MovieTrailersModel(
        id: json["id"],
        results: List<VideoInfoModel>.from(
            json["results"].map((x) => VideoInfoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class VideoInfoModel {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  VideoInfoModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory VideoInfoModel.fromJson(Map<String, dynamic> json) => VideoInfoModel(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: DateTime.parse(json["published_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt.toIso8601String(),
        "id": id,
      };
}
