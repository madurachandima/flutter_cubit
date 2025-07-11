import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getTrailerById<T>(UseCase useCase, {required int id}) async {
    var result = await useCase.call(params: id);
    if (result.exception != null) {
      emit(TrailerError(errorMessage: "Something went wrong"));
    } else {
      var trailers = result.result.results ?? [];
      var trailer = trailers.first;

      if (trailer.key == null) {
        emit(TrailerError(errorMessage: "Something went wrong"));
      } else {
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailer.key! as String,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        emit(TrailerLoaded(controller: controller, trailers: trailers));
      }
    }
  }
}
