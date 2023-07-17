import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/infrastructure/models/models.dart';

class PersonMapper {
  static Person castToEntitity(PersonModel personModel) => Person(
        biography: personModel.biography ?? '',
        birthday: personModel.birthday ?? '',
        gender: personModel.gender,
        id: personModel.id,
        knownForDepartment: personModel.knownForDepartment ?? '',
        name: personModel.name,
        placeOfBirth:
            personModel.placeOfBirth != 'null' ? personModel.placeOfBirth! : '',
        popularity: personModel.popularity ?? 0.0,
        profilePath: personModel.profilePath != ''
            ? 'https://image.tmdb.org/t/p/w500${personModel.profilePath}'
            : 'assets/images/no-photo.png',
        deathday: personModel.deathday ?? '',
      );
}
