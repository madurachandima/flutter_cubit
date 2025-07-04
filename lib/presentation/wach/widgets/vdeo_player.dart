import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/presentation/wach/bloc/trailer_cubit.dart';
import 'package:movie_app_cubit/presentation/wach/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final int id;

  const VideoPlayer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailerById(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: const ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),

            );
          }

          if (state is TrailerError) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
