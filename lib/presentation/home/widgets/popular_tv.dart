import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_cubit.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_state.dart';
import 'package:movie_app_cubit/common/widgets/tv/tv_card.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_popular_tvs_hows.dart';
import 'package:movie_app_cubit/service_locator.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TvDataEntity>>(sl<GetPopularTvShowsUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const CircularProgressIndicator();
        }

        if (state is DataLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TvCard(tvDataEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.data.length),
          );
        }

        if (state is DataError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
