class Person {
  final String name;
  final String id;
  final String biography;
  final String birthday;
  final String deathday;
  final int gender;
  final String knownForDepartment;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;

  Person({
    required this.biography,
    required this.birthday,
    this.deathday = '',
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });
}
