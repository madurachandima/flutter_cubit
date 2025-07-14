import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_app_cubit/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app_cubit/common/helper/mapper/tvmapper/tv_mapper.dart';
import 'package:movie_app_cubit/core/model/key_word_model.dart';
import 'package:movie_app_cubit/core/model/trailer_model.dart';
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
          TrailerMapper.toEntity(TrailerModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Result> getKeyWordsById(int id) async {
    try {
      Result result = await sl<TvService>().getKeyWordsById(id);
      if (result.exception != null) {
        return result;
      }
      result.result =
          KeyWordMapper.toEntity(KeyWordModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Result> searchTv(String query,int? page) async {
    try {
      Result result = await sl<TvService>().searchTv(query,page);
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
