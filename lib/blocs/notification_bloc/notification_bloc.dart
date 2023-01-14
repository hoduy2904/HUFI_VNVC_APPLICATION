import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_event.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_state.dart';
import 'package:hufi_vnvc_application/repositories/notification_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<OnLoadNotificationEvent>((event, emit) async {
      emit(NotificationLoadingState());
      try {
        var notifications = await NotificationRepository().getNotifications();
        emit(NotificationSuccessState(notifications: notifications));
      } catch (e) {
        emit(NotificationFailedState(error: e.toString()));
      }
    });
  }
}
