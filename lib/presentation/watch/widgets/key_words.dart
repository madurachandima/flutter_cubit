import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_cubit.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_state.dart';
import 'package:movie_app_cubit/core/entity/key_word_entity.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';

class KeyWords extends StatelessWidget {
  final UseCase useCase;
  final int id;

  const KeyWords({super.key, required this.useCase, required this.id});

  @override
  Widget build(BuildContext context) {
    return

      BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeyWordDataEntity>>(useCase, params: id),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const CircularProgressIndicator();
        }

        if (state is DataLoaded) {
          List<KeyWordDataEntity> keyWords = state.data;
          return Wrap(
            spacing: 8,
            children:
                keyWords.map((e) => Chip(label: Text(e.name ?? "-"))).toList(),
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
