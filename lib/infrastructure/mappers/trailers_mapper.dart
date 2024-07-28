import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/infrastructure/models/moviedb/movie_trailers_response.dart';

class TrailersMapper {
  static MovieTrailers movieTrailerResponseToEntity(
          VideoInfoModel videoInfoModel) =>
      MovieTrailers(
        name: videoInfoModel.name,
        key: videoInfoModel.key,
        site: videoInfoModel.site,
        size: videoInfoModel.size,
        type: videoInfoModel.type,
        official: videoInfoModel.official,
        publishedAt: videoInfoModel.publishedAt,
      );
}
