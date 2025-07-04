import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/widgets/tv/tv_card.dart';
import 'package:movie_app_cubit/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app_cubit/presentation/home/bloc/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTv(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
          builder: (context, state) {
            if (state is PopularTvLoading) {
              return const CircularProgressIndicator();
            }

            if (state is PopularTvLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding:const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TvCard(tvDataEntity: state.tvShows[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: state.tvShows.length),
              );
            }

            if (state is PopularTvError) {
              return Text(state.errorMessage);
            }
            return Container();
          }),
    );
  }
}
