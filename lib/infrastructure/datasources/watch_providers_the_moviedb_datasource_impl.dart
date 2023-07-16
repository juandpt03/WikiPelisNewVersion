import 'package:dio/dio.dart';
import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/domain/datasources/watch_providers_datasource.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/infrastructure/mappers/watch_provider_mapper.dart';
import 'package:wikipelis/infrastructure/models/watch_providersdb/watch_providers_model_response.dart';
import 'package:wikipelis/presentation/utils/app_language/app_language.dart';

class WatchProvidersTheMoviedbDataSource extends WatchProvidersDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': AppLanguage.getLocale().toString().replaceAll('_', '-'),
    },
  ));
  @override
  Future<List<WatchProvider>> getWatchProvidersByMovieId(
      {required String movieId}) async {
    final response = await dio.get('/movie/$movieId/watch/providers');
    List<WatchProvider> watchProviders = [];

    final watchProviderModel =
        WatchProvidersModelResponse.fromJson(response.data);
    if (watchProviderModel.results.co?.flatrate == null ||
        watchProviderModel.results.co == null) return [];
    for (Flatrate watchModel in watchProviderModel.results.co!.flatrate!) {
      WatchProvider watchProvider =
          WatchProviderMapper.watchProviderResponseToEntity(watchModel);
      watchProviders.add(watchProvider);
    }

    return watchProviders;
  }
}
