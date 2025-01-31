import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  // Private static variable to hold the single instance of the class
  static final PushNotificationService _instance =
      PushNotificationService._internal();

  // Private constructor
  PushNotificationService._internal();

  // Public factory constructor to return the instance
  factory PushNotificationService() {
    return _instance;
  }

  Future<void> register() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    debugPrint('User granted permission: ${settings.authorizationStatus}');
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken == null) {
      debugPrint("Not FCM Token");
    }
    debugPrint("FCM-TOKEN: " + fcmToken.toString());
  }

  void fromForeground(Function(RemoteMessage message) receivePush) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Received (Foreground) Message: ${message}');
      receivePush(message);
    });
  }

  void fromBackground(Function(RemoteMessage message) receivePush) async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property,
    // navigate to a chat screen
    if (initialMessage != null) {
      debugPrint('Received (Initial) Message: ${initialMessage}');
      receivePush(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Received (Background) Message: ${message}');
      receivePush(message);
    });
  }
}
