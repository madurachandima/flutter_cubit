import 'dart:convert';

TvTrailerModel movieTrailerModelFromJson(String str) =>
    TvTrailerModel.fromJson(json.decode(str));

class TvTrailerModel {
  final int? id;
  final List<TvTrailer>? results;

  TvTrailerModel({
    this.id,
    this.results,
  });

  factory TvTrailerModel.fromJson(Map<String, dynamic> json) =>
      TvTrailerModel(
        id: json["id"],
        results: json["results"] == null
            ? []
            : List<TvTrailer>.from(
            json["results"]!.map((x) => TvTrailer.fromJson(x))),
      );
}

class TvTrailer {
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

  TvTrailer({
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

  factory TvTrailer.fromJson(Map<String, dynamic> json) => TvTrailer(
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
