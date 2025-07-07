import 'package:movie_app_cubit/data/movie/models/movie/movie_model.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
        page: movie.page,
        totalPages: movie.totalPages,
        totalResults: movie.totalResults,
        results: movie.results == null
            ? []
            : movie.results!
                .map((e) => MovieDataEntity(
                    adult: e.adult,
                    backdropPath: e.backdropPath,
                    overview: e.overview,
                    popularity: e.popularity,
                    posterPath: e.posterPath,
                    genreIds: e.genreIds,
                    id: e.id,
                    originalLanguage: e.originalLanguage,
                    originalTitle: e.originalTitle,
                    title: e.title,
                    voteAverage: e.voteAverage,
                    releaseDate: e.releaseDate))
                .toList());
  }
}
