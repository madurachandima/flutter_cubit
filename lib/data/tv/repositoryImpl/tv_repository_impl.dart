import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/common/helper/tvmapper/tv_mapper.dart';
import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/data/tv/datasources/tv_api_service.dart';
import 'package:movie_app_cubit/data/tv/models/tv/tv_model.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Result> getPopularTv() async {
    try {
      Result result = await sl<TvService>().getPopularTv();
      if (result.exception != null) {
        return result;
      }
      result.result = TvMapper.toEntity(TvModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }
}
