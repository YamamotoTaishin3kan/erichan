import 'package:erichan/administrator/entities/task_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationsManager {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static int notificationID = 0;

  NotificationsManager();

  static void initialize() async {
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: null,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void deleteAllNotifications() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> setNotification(InfoBase contents) async {
    if (contents is AlbumInfo) return;
    TaskInfo taskInfo = contents as TaskInfo;

    return flutterLocalNotificationsPlugin.zonedSchedule(
        notificationID++,
        taskInfo.deadline.getTimeLeft(),
        taskInfo.title,
        tz.TZDateTime.now(tz.UTC).add(taskInfo.deadline.toDuration()),
        const NotificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  static Future<void> deleteNotification(InfoBase contents) async {}
}
