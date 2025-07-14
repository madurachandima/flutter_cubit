import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class GetPopularTvShowsUseCase extends UseCase<Result, dynamic,dynamic> {
  @override
  Future<Result> call({params,page}) async {
    return await sl<TvRepository>().getPopularTv();
  }
}
