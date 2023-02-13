import 'package:equatable/equatable.dart';

class NotificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoadNotificationEvent extends NotificationEvent {}

class OnFetchNotificationEvent extends NotificationEvent {}

class OnReadNotificationEvent extends NotificationEvent {
  final int id;
  OnReadNotificationEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
