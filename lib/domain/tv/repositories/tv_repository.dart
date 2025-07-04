import 'package:movie_app_cubit/core/network/net_result.dart';

abstract class TvRepository {
  Future<Result> getPopularTv();
}
