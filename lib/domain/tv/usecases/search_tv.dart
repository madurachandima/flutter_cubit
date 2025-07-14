import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SearchTvShowsUseCase extends UseCase<Result, String?> {
  @override
  Future<Result> call({params}) async {
    if (params == null) {
      throw Exception("Tv series name cannot be null");
    }
    return await sl<TvRepository>().searchTv(params);
  }
}
