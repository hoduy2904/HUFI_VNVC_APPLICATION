import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/repositories/product_repository.dart';

class VaccineBloc extends Bloc<VaccineEvent, VaccineState> {
  VaccineBloc() : super(VaccineState()) {
    on<OnLoadVaccineEvent>((event, emit) async {
      emit(VaccineLoadingState());
      try {
        var vaccines = await ProductRepository().getVaccines(page: 1, size: 20);
        emit(VaccineSuccessState(vaccines: vaccines));
      } catch (e) {
        emit(VaccineFailedState(error: e.toString()));
      }
    });
  }
}
