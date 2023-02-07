import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/code_verify_bloc/code_verify_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/code_verify_bloc/code_verify_state.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';

class CodeVerifyBloc extends Bloc<CodeVerifyEvent, CodeVerifyState> {
  CodeVerifyBloc() : super(CodeVerifyState()) {
    on<OnClickVerifyEvent>((event, emit) async {
      emit(CodeVerifyLoadingState());
      try {
        var response =
            await AuthRepository().verifyCode(id: event.id, code: event.code);
        if (response.isSuccess) {
          emit(CodeVerifySuccessState());
        } else {
          emit(CodeVerifyFailedState(error: response.messages.first));
        }
      } catch (e) {
        emit(CodeVerifyFailedState(error: e.toString()));
      }
    });
    on<OnResendCodeEvent>((event, emit) async {
      try {
        var response = await AuthRepository().reSendVerifyCode(event.userId);
        if (!response.isSuccess) {
          emit(CodeVerifyFailedState(error: response.messages.first));
        }
      } catch (e) {
        emit(CodeVerifyFailedState(error: e.toString()));
      }
    });
    on<OnLoadRegisterEvent>((event, emit) async {});
  }
}
