import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/infrastructure/datasources/the_moviedb_datasource_impl.dart';
import 'package:wikipelis/infrastructure/repositorie/movie_repository_impl.dart';

final movieRepositoryProvider = Provider(
  (ref) => MovieRepositoryImpl(TheMoviedbDatasourceImpl()),
);
