class KeyWordEntity {
  final int? id;
  final List<KeyWordDataEntity>? results;

  KeyWordEntity({
    this.id,
     this.results,
  });
}

class KeyWordDataEntity {
  final String? name;
  final int? id;

  KeyWordDataEntity({
    this.name,
    this.id,
  });
}
