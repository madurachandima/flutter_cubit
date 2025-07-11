import 'package:dio/dio.dart';
import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/core/constants/api_url.dart';
import 'package:movie_app_cubit/core/network/dio_client.dart';
import 'package:movie_app_cubit/core/network/net_exception.dart';
import 'package:movie_app_cubit/service_locator.dart';

import '../../../core/network/net_result.dart';

abstract class TvService {
  Future<Result> getPopularTv();

  Future<Result> getTvTrailerById(int id);

  Future<Result> getRecommendedTvSeriesById(int id);

  Future<Result> getSimilarTvSeriesById(int id);
}

class TvApiServiceImpl extends TvService {
  @override
  Future<Result> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingTvs,
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> getRecommendedTvSeriesById(int id) async{
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getRecommendedTvsById.replaceAll("{tv_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
            message: e.message,
            code: e.response?.statusCode,
          ));
    }
  }

  @override
  Future<Result> getSimilarTvSeriesById(int id) async{
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getSimilarTvsById.replaceAll("{tv_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
            message: e.message,
            code: e.response?.statusCode,
          ));
    }
  }

  @override
  Future<Result> getTvTrailerById(int id)async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getTvTrailerById.replaceAll("{tv_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
            message: e.message,
            code: e.response?.statusCode,
          ));
    }
  }
}
