import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/common/helper/tvmapper/tv_mapper.dart';
import 'package:movie_app_cubit/common/helper/tvmapper/tv_trailer_mapper.dart';
import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/data/tv/datasources/tv_api_service.dart';
import 'package:movie_app_cubit/data/tv/models/tv/tv_model.dart';
import 'package:movie_app_cubit/data/tv/models/tv/tv_trailer_model.dart';
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

  @override
  Future<Result> getRecommendedTvsById(int id) async {
    try {
      Result result = await sl<TvService>().getRecommendedTvSeriesById(id);
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

  @override
  Future<Result> getSimilarTvsById(int id) async {
    try {
      Result result = await sl<TvService>().getSimilarTvSeriesById(id);
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

  @override
  Future<Result> getTvTrailerById(int id) async {
    try {
      Result result = await sl<TvService>().getTvTrailerById(id);
      if (result.exception != null) {
        return result;
      }
      result.result =
          TvTrailerMapper.toEntity(TvTrailerModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }
}
