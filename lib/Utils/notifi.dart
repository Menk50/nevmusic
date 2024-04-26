import 'dart:async';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final _notifications = FlutterLocalNotificationsPlugin();
  Random random = Random();
  static Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    const androidInitialize = AndroidInitializationSettings('ic_launcher');

    //const IOSNotificationDetails iosDetails = IOSNotificationDetails();

    const InitializationSettings initializationsSettings =
        InitializationSettings(
      android: androidInitialize,
      //iOS: iosInitialize,
    );

    await _notifications.initialize(initializationsSettings);
  }

  static Future _notificationDetails() async => const NotificationDetails(
        android: AndroidNotificationDetails(
          "nevMusic",
          "nevMusic",
          channelDescription: "nevMusic",
          enableLights: true,
          importance: Importance.max,
        ),
      );

  static Future showNotification({
    required int id,
    required String title,
    required String body,
    required String payload, // bildirime extra veri eklemek istersek
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
