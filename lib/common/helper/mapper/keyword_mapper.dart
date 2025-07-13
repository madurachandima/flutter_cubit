import 'package:movie_app_cubit/core/entity/key_word_entity.dart';
import 'package:movie_app_cubit/core/model/key_word_model.dart';

class KeyWordMapper {
  static KeyWordEntity toEntity(KeyWordModel keyWordModel) {
    return KeyWordEntity(
        id: keyWordModel.id,
        results: keyWordModel.results == null
            ? []
            : keyWordModel.results!
                .map((e) => KeyWordDataEntity(name: e.name, id: e.id))
                .toList());
  }
}
