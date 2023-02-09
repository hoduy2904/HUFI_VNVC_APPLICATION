import 'package:equatable/equatable.dart';

class NotificationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadNotificationEvent extends NotificationEvent {}

class OnFetchNotificationEvent extends NotificationEvent {}

class OnReadNotificationEvent extends NotificationEvent {
  final int id;
  OnReadNotificationEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
