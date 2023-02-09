import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/notification_model.dart';

enum NotificationStatus { Loading, Success, Failed }

class NotificationState extends Equatable {
  final int currentPage;
  final NotificationStatus status;
  final bool isEndPage;
  final String? message;
  final List<NotificationModel> notifications;
  const NotificationState(
      {this.message,
      this.currentPage = 1,
      this.status = NotificationStatus.Loading,
      this.isEndPage = false,
      this.notifications = const []});
  NotificationState copyWith(
      {int? currentPage,
      NotificationStatus? status,
      String? message,
      bool? isEndPage,
      List<NotificationModel>? notifications}) {
    return NotificationState(
        message: message ?? this.message,
        currentPage: currentPage ?? this.currentPage,
        status: status ?? this.status,
        isEndPage: isEndPage ?? this.isEndPage,
        notifications: notifications ?? this.notifications);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [currentPage, status, isEndPage, notifications, message];
}
