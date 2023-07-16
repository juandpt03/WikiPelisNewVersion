import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/infrastructure/models/models.dart';

class WatchProviderMapper {
  static WatchProvider watchProviderResponseToEntity(
          Flatrate watchProviderModel) =>
      WatchProvider(
        logoPath: watchProviderModel.logoPath != null
            ? 'https://image.tmdb.org/t/p/w500${watchProviderModel.logoPath}'
            : '',
        providerId: watchProviderModel.providerId ?? 0,
        providerName: watchProviderModel.providerName ?? '',
        displayPriority: watchProviderModel.displayPriority ?? 0,
      );
}
