import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_state.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(UseCase useCase, {dynamic params}) async {
    var result = await useCase.call(params: params);
    if (result.exception != null) {
      emit(DataError(errorMessage: "Something went wrong"));
    } else {
      var data = result.result.results ?? [];
      emit(DataLoaded<T>(data: data));
    }
  }
}
