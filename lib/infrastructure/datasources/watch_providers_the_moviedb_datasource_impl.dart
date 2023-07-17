import 'package:dio/dio.dart';
import 'package:wikipelis/config/constants/environment.dart';
import 'package:wikipelis/config/helpers/helpers.dart';

import 'package:wikipelis/domain/datasources/watch_providers_datasource.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/infrastructure/mappers/watch_provider_mapper.dart';
import 'package:wikipelis/infrastructure/models/watch_providersdb/watch_providers_model_response.dart';
import 'package:wikipelis/presentation/utils/utils.dart';

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

    final watchProviderModel =
        WatchProvidersModelResponse.fromJson(response.data);

    List<Flatrate>? watchProviderList =
        WatchProviderByCountry.getListByCountry(watchProviderModel);

    if (watchProviderList == null) {
      return [];
    }

    List<WatchProvider> watchProviders = watchProviderList
        .map((watchModel) =>
            WatchProviderMapper.watchProviderResponseToEntity(watchModel))
        .toList();

    return watchProviders;
  }
}
