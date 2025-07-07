import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie_trailer.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_movie_trailer_by_id.dart';
import 'package:movie_app_cubit/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app_cubit/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailerById(int movieId) async {
    var result = await sl<GetMovieTrailerByIdUseCase>().call(params: movieId);
    if (result.exception != null) {
      emit(TrailerError(errorMessage: "Something went wrong"));
    } else {
      MovieTrailerEntity trailerEntity = result.result;

      List<MovieTrailerDataEntity> movieTrailers = trailerEntity.results ?? [];
      MovieTrailerDataEntity movieTrailer = movieTrailers.first;
      if (movieTrailer.key == null) {
        emit(TrailerError(errorMessage: "Something went wrong"));
      } else {
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: movieTrailer.key!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        emit(TrailerLoaded(
            controller: controller, movieTrailers: movieTrailers));
      }
    }
  }
}
