import 'package:wikipelis/domain/datasources/local_storage_datasource.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSoruce dataSource;

  LocalStorageRepositoryImpl(this.dataSource);
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return dataSource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return dataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return dataSource.toggleFavorite(movie);
  }
}
