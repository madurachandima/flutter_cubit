import 'package:get_it/get_it.dart';
import 'package:movie_app_cubit/core/network/dio_client.dart';
import 'package:movie_app_cubit/data/auth/datasources/authentication/auth_api_service.dart';
import 'package:movie_app_cubit/data/auth/repositoryImpl/authRepoImpl.dart';
import 'package:movie_app_cubit/data/movie/datasources/movie_api_service.dart';
import 'package:movie_app_cubit/data/movie/repositoryImpl/movie_repository_impl.dart';
import 'package:movie_app_cubit/data/tv/datasources/tv_api_service.dart';
import 'package:movie_app_cubit/data/tv/repositoryImpl/tv_repository_impl.dart';
import 'package:movie_app_cubit/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app_cubit/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app_cubit/domain/auth/usecases/signin.dart';
import 'package:movie_app_cubit/domain/auth/usecases/signup.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_movie_trailer_by_id.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_recommended_movie_by_id.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_similar_movie_by_id.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_popular_tvs_hows.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_recommended_tv_by_id.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_similar_tv_by_id.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_tv_trailer_by_id.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthenticationService>(AuthenticationApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TvService>(TvApiServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthenticationRepoImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  //UseCase
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<IsSignInUseCase>(IsSignInUseCase());

  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
      GetNowPlayingMoviesUseCase());
// Movie
  sl.registerSingleton<GetMovieTrailerByIdUseCase>(
      GetMovieTrailerByIdUseCase());
  sl.registerSingleton<GetRecommendedMovieByIdUseCase>(
      GetRecommendedMovieByIdUseCase());
  sl.registerSingleton<GetSimilarMovieByIdUseCase>(
      GetSimilarMovieByIdUseCase());

  // TV
  sl.registerSingleton<GetPopularTvShowsUseCase>(GetPopularTvShowsUseCase());
  sl.registerSingleton<GetRecommendedTvByIdUseCase>(
      GetRecommendedTvByIdUseCase());
  sl.registerSingleton<GetSimilarTvByIdUseCase>(GetSimilarTvByIdUseCase());
  sl.registerSingleton<GetTvTrailerByIdUseCase>(GetTvTrailerByIdUseCase());
}
