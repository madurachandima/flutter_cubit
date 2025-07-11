import 'package:movie_app_cubit/data/tv/models/tv/tv_trailer_model.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv_trailer.dart';

class TvTrailerMapper {
  static TvTrailerEntity toEntity(TvTrailerModel tvTrailer) {
    return TvTrailerEntity(
        id: tvTrailer.id,
        results: tvTrailer.results == null
            ? []
            : tvTrailer.results!
                .map((e) => TvTrailerDataEntity(
                      iso6391: e.iso6391,
                      iso31661: e.iso31661,
                      name: e.name,
                      key: e.key,
                      site: e.site,
                      size: e.size,
                      type: e.type,
                      official: e.official,
                      publishedAt: e.publishedAt,
                      id: e.id,
                    ))
                .toList());
  }
}
