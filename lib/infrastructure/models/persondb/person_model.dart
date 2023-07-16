// To parse this JSON data, do
//
//     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

PersonModel personModelFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

class PersonModel {
  final bool adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final dynamic deathday;
  final int gender;
  final dynamic homepage;
  final String id;
  final String? imdbId;
  final String? knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double? popularity;
  final String? profilePath;

  PersonModel({
    required this.adult,
    this.alsoKnownAs = const [],
    required this.biography,
    required this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: json["birthday"] ?? '',
        deathday: json["deathday"] ?? '',
        gender: json["gender"],
        homepage: json["homepage"] ?? '',
        id: json["id"].toString(),
        imdbId: json["imdb_id"] ?? '',
        knownForDepartment: json["known_for_department"] ?? '',
        name: json["name"],
        placeOfBirth: json["place_of_birth"].toString(),
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        profilePath: json["profile_path"] ?? '',
      );
}
