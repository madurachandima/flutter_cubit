import 'dart:convert';

MovieTrailerModel movieTrailerModelFromJson(String str) =>
    MovieTrailerModel.fromJson(json.decode(str));

class MovieTrailerModel {
  final int? id;
  final List<MovieTrailer>? results;

  MovieTrailerModel({
    this.id,
    this.results,
  });

  factory MovieTrailerModel.fromJson(Map<String, dynamic> json) =>
      MovieTrailerModel(
        id: json["id"],
        results: json["results"] == null
            ? []
            : List<MovieTrailer>.from(
                json["results"]!.map((x) => MovieTrailer.fromJson(x))),
      );
}

class MovieTrailer {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? publishedAt;
  final String? id;

  MovieTrailer({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MovieTrailer.fromJson(Map<String, dynamic> json) => MovieTrailer(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"],
        id: json["id"],
      );
}
