class TvTrailerEntity {
  final int? id;
  final List<TvTrailerDataEntity>? results;

  TvTrailerEntity({
    this.id,
    this.results,
  });
}

class TvTrailerDataEntity {
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

  TvTrailerDataEntity({
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
}
