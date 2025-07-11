import 'package:movie_app_cubit/core/network/net_result.dart';

abstract class TvRepository {
  Future<Result> getPopularTv();

  Future<Result> getTvTrailerById(int id);

  Future<Result> getRecommendedTvsById(int id);

  Future<Result> getSimilarTvsById(int id);
}
