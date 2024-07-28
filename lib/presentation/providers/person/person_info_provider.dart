import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/presentation/providers/person/person_info_repository_provider.dart';

import '../../../domain/entities/entities.dart';

final personInfoProvider = FutureProvider.autoDispose.family<Person, String>((
  ref,
  String personId,
) async {
  return await ref
      .watch(personInfoRepositoryProvider)
      .getPersonInfoById(personId: personId);
});
