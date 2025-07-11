import 'dart:convert';

TvModel tvModelFromJson(String str) => TvModel.fromJson(json.decode(str));

class TvModel {
  final int? page;
  final List<Tv>? results;
  final int? totalPages;
  final int? totalResults;

  TvModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Tv>.from(json["results"]!.map((x) => Tv.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Tv {
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

  Tv({
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

  factory Tv.fromJson(Map<String, dynamic> json) => Tv(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.tryParse(json["first_air_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
      );
}
