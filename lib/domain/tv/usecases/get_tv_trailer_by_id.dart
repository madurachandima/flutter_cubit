import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class GetTvTrailerByIdUseCase extends UseCase<Result, int> {
  @override
  Future<Result> call({int? params}) async {
    if (params == null) {
      throw Exception("Tv id required");
    }
    return await sl<TvRepository>().getTvTrailerById(params);
  }
}
