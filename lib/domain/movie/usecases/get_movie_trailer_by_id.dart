import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class GetMovieTrailerByIdUseCase extends UseCase<Result, int, dynamic> {
  @override
  Future<Result> call({int? params, page}) async {
    if (params == null) {
      throw Exception("Movie id required");
    }
    return await sl<MovieRepository>().getMovieTrailerById(params);
  }
}
