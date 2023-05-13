import 'package:wikipelis/domain/datasources/movies_datasource.dart';
import 'package:wikipelis/domain/entities/movie.dart';
import 'package:wikipelis/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> topRated({int page = 1}) {
    return dataSource.topRated(page: page);
  }

  @override
  Future<List<Movie>> upComing({int page = 1}) {
    return dataSource.upComing();
  }
}
