import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart'; // Generated by Firebase CLI
import 'package:tes/app/routes/app_pages.dart'; // Import your new page
import 'package:get_storage/get_storage.dart';


final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  // Show background notification with MessagingStyle
  final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    channelDescription: 'Deskripsi Channel',
    importance: Importance.max,
    priority: Priority.high,
    styleInformation: MessagingStyleInformation(
      Person(name: message.notification?.title ?? 'Notification', icon: const DrawableResourceAndroidIcon('@mipmap/ic_launcher')),
      messages: [
        Message(
          message.notification?.body ?? '',
          DateTime.now(),
          Person(name: 'Message', icon: const DrawableResourceAndroidIcon('@mipmap/ic_launcher')),
        ),
      ],
      groupConversation: true,
    ),
    timeoutAfter: 10000, // Set duration to 10 seconds
  );

  final NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

  await _localNotifications.show(
    message.hashCode,
    message.notification?.title ?? "Notification",
    message.notification?.body ?? "You have a new message.",
    platformDetails,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();


  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);

  const AndroidInitializationSettings androidInitSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initSettings = InitializationSettings(android: androidInitSettings);

  await _localNotifications.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print("Notification tapped with payload: ${response.payload}");
    },
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL, 
      getPages: AppPages.routes,
    );
  }
}