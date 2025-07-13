import 'dart:convert';

KeyWordModel keyWordModelFromJson(String str) =>
    KeyWordModel.fromJson(json.decode(str));

class KeyWordModel {
  final int? id;
  final List<KeyWordDataModel>? results;

  KeyWordModel({
    this.id,
    this.results,
  });

// keywords
  factory KeyWordModel.fromJson(Map<String, dynamic> json) => KeyWordModel(
        id: json["id"],
        results: json["results"] != null
            ? List<KeyWordDataModel>.from(
                json["results"]!.map((x) => KeyWordDataModel.fromJson(x)))
            : json['keywords'] != null
                ? List<KeyWordDataModel>.from(
                    json["keywords"]!.map((x) => KeyWordDataModel.fromJson(x)))
                : [],
      );
}

class KeyWordDataModel {
  final String? name;
  final int? id;

  KeyWordDataModel({
    this.name,
    this.id,
  });

  factory KeyWordDataModel.fromJson(Map<String, dynamic> json) =>
      KeyWordDataModel(
        name: json["name"],
        id: json["id"],
      );
}
