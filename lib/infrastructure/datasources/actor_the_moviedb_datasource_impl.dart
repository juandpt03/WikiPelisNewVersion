import 'package:dio/dio.dart';
import 'package:wikipelis/config/app_language/app_language.dart';
import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/domain/datasources/actors_datasource.dart';
import 'package:wikipelis/domain/entities/actor.dart';
import 'package:wikipelis/infrastructure/mappers/actor_mapper.dart';
import 'package:wikipelis/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': AppLanguage.getLocale().toString().replaceAll('_', '-'),
    },
  ));
  @override
  Future<List<Actor>> getActorsByMovie(String idMovie) async {
    final response = await dio.get('/movie/$idMovie/credits');
    if (response.statusCode != 200) {
      return throw Exception('Movie With id: $idMovie  not found');
    }
    final creditsResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntitity(cast))
        .toList();
    return actors;
  }
}
