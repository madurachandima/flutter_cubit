import 'package:movie_app_cubit/core/entity/trailer_entity.dart';
import 'package:movie_app_cubit/core/model/trailer_model.dart';

class TrailerMapper {
  static TrailerEntity toEntity(TrailerModel trailer) {
    return TrailerEntity(
        id: trailer.id,
        results: trailer.results == null
            ? []
            : trailer.results!
                .map((e) => TrailerDataEntity(
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
