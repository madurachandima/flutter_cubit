import 'package:movie_app_cubit/data/movie/models/movie/movie_trailer_model.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie_trailer.dart';

class MovieTrailerMapper {
  static MovieTrailerEntity toEntity(MovieTrailerModel movieTrailer) {
    return MovieTrailerEntity(
        id: movieTrailer.id,
        results: movieTrailer.results == null
            ? []
            : movieTrailer.results!
                .map((e) => MovieTrailerDataEntity(
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
