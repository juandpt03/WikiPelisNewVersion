import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wikipelis/domain/datasources/local_storage_datasource.dart';
import 'package:wikipelis/domain/entities/movie.dart';

class IsarDataSource extends LocalStorageDataSoruce {
  late Future<Isar> db;

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  IsarDataSource() {
    db = openDB();
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();
    if (favoriteMovie != null) {
      //borrar
      isar.writeTxnSync(
        () => isar.movies.deleteSync(favoriteMovie.isarId!),
      );
      return;
    }
    //insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
