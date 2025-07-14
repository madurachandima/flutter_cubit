import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class GetNowPlayingMoviesUseCase extends UseCase<Result, dynamic, dynamic> {
  @override
  Future<Result> call({params, page}) async {
    return await sl<MovieRepository>().nowPlayingMovies();
  }
}
