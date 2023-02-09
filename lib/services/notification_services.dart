import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<NotificationDetails> notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails("channel_id", "Channel Name",
            importance: Importance.max),
        iOS: IOSNotificationDetails());
  }

  Future<void> showNotification({
    int id = 0,
    required String title,
    required String body,
  }) async {
    flutterLocalNotificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
}
