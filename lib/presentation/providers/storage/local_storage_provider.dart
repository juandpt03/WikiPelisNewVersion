import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/infrastructure/datasources/isart_datasource.dart';
import 'package:wikipelis/infrastructure/repositorie/local_storage_repostory_impl.dart';

final localStorageRepositoryProvider =
    Provider((ref) => LocalStorageRepositoryImpl(IsarDataSource()));
