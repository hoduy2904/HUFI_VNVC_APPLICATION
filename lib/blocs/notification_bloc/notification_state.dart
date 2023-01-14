import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/notification_model.dart';

class NotificationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotificationLoadingState extends NotificationState {}

class NotificationSuccessState extends NotificationState {
  final List<NotificationModel> notifications;
  NotificationSuccessState({this.notifications = const []});
  @override
  // TODO: implement props
  List<Object?> get props => [notifications];
}

class NotificationFailedState extends NotificationState {
  final String error;
  NotificationFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
