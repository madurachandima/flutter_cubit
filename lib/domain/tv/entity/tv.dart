import 'package:movie_app_cubit/core/constants/api_url.dart';

class TvEntity {
  final int? page;
  final List<TvDataEntity>? results;
  final int? totalPages;
  final int? totalResults;

  TvEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
}

class TvDataEntity {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? name;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final DateTime? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? originCountry;

  TvDataEntity({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  String providePosterPath() {
    return "${ApiUrl.imageBaseURL}${posterPath ?? ""}";
  }
}
