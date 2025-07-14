import 'package:movie_app_cubit/core/constants/api_url.dart';

class MovieEntity {
  final int? page;
  final List<MovieDataEntity>? results;
  final int? totalPages;
  final int? totalResults;

  MovieEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
}

class MovieDataEntity {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDataEntity({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  String providePosterPath() {
    return "${ApiUrl.imageBaseURL}${posterPath ?? ApiUrl.emptyImage}";
  }
}
