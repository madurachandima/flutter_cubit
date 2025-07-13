import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class GetMovieKeyWordsUseCase extends UseCase<Result, dynamic> {
  @override
  Future<Result> call({params}) async {
    return await sl<MovieRepository>().getKeyWordsById(params);
  }
}
