import 'package:movie_app_cubit/data/tv/models/tv/tv_model.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';

class TvMapper {
  static TvEntity toEntity(TvModel tv) {
    return TvEntity(
        page: tv.page,
        totalPages: tv.totalPages,
        totalResults: tv.totalResults,
        results: tv.results == null
            ? []
            : tv.results!
                .map((e) => TvDataEntity(
                      adult: e.adult,
                      backdropPath: e.backdropPath,
                      overview: e.overview,
                      popularity: e.popularity,
                      posterPath: e.posterPath,
                      genreIds: e.genreIds,
                      id: e.id,
                      originalLanguage: e.originalLanguage,
                      originalName: e.originalName,
                      name: e.name,
                      voteAverage: e.voteAverage,
                    ))
                .toList());
  }
}
