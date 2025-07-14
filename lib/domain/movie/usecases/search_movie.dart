import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SearchMovieUseCase extends UseCase<Result, String> {
  @override
  Future<Result> call({String? params}) async {
    if (params == null) {
      throw Exception("Please enter the movie name");
    }
    return await sl<MovieRepository>().searchMovie(params);
  }
}
