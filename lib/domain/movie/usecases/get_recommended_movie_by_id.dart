import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class GetRecommendedMovieByIdUseCase extends UseCase<Result, dynamic,dynamic> {
  @override
  Future<Result> call({params,page}) async {
    if (params == null) {
      throw Exception("Movie id required");
    }
    return await sl<MovieRepository>().getRecommendedMoviesById(params);
  }
}
