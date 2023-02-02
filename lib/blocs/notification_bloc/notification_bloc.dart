import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_event.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_state.dart';
import 'package:hufi_vnvc_application/models/notification_model.dart';
import 'package:hufi_vnvc_application/models/user_model.dart';
import 'package:hufi_vnvc_application/repositories/notification_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    int pageSize = 10;
    on<OnLoadNotificationEvent>((event, emit) async {
      emit(state.copyWith(status: NotificationStatus.Loading));
      try {
        var prefs = await SharedPreferences.getInstance();
        var userString = prefs.getString("user");
        var user = UserModel.fromJson(jsonDecode(userString!));
        var notifications = await NotificationRepository()
            .getNotifications(loginId: user.id, page: 1, pageSize: pageSize);
        emit(state.copyWith(
            notifications: notifications,
            status: NotificationStatus.Success,
            currentPage: 1,
            isEndPage: false));
      } catch (e) {
        if (e.toString() == "401") {
          emit(state.copyWith(
              message: "Vui lòng đăng nhập lại",
              status: NotificationStatus.Failed));
        }
        emit(state.copyWith(
            message: e.toString(), status: NotificationStatus.Failed));
      }
    });
    on<OnFetchNotificationEvent>((event, emit) async {
      try {
        var prefs = await SharedPreferences.getInstance();
        var userString = prefs.getString("user");
        var user = UserModel.fromJson(jsonDecode(userString!));

        if (!state.isEndPage) {
          var notifications = await NotificationRepository().getNotifications(
              loginId: user.id,
              page: state.currentPage + 1,
              pageSize: pageSize);
          if (notifications.length < pageSize) {
            emit(state.copyWith(isEndPage: true));
          }
          emit(state.copyWith(
              message: '',
              currentPage: state.currentPage + 1,
              status: NotificationStatus.Success));
          state.notifications.addAll(notifications);
        }
      } catch (e) {
        emit(state.copyWith(message: e.toString()));
      }
    });
    on<OnReadNotificationEvent>((event, emit) async {
      try {
        var prefs = await SharedPreferences.getInstance();
        var userString = prefs.getString("user");
        var user = UserModel.fromJson(jsonDecode(userString!));
        var response = await NotificationRepository()
            .updateReadNotifications(event.id, user.id);
        if (response.isSuccess) {
          var notification = state.notifications
              .firstWhere((element) => element.id == event.id);
          notification = NotificationModel(
              image: notification.image,
              loginId: notification.loginId,
              title: notification.title,
              isSeen: true,
              content: notification.content,
              created: notification.created,
              id: notification.id);
        }
        emit(state.copyWith());
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
