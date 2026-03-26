// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
 
//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//    final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initFCM() async {
   
//     await _messaging.requestPermission();
//     String? token = await _messaging.getToken();
//     print("FCM TOKEN: $token");

//      // initialize local notifications
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'channel_id',
//   'channel_name',
//   description: 'This channel is used for important notifications.',
//   importance: Importance.high,
// );

// await _localNotifications
//     .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//     ?.createNotificationChannel(channel);

    
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("Got a message while in the foreground!");
//       // print('Message:${message.notification?.title}');
//       if (message.notification != null) {
//         showNotification(message); // ✅ call here
//       }
    
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Message:${message.notification?.title}');
//     });
//   }

//   Future<void> showNotification(RemoteMessage message) async {

//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails details =
//         NotificationDetails(android: androidDetails);

//    await _localNotifications.show(
//   id: 0,
//   title: message.notification?.title ?? "No Title",
//   body: message.notification?.body ?? "No Body",
//   notificationDetails: details,
// );
//   }

  
// }

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
 
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

   final FlutterLocalNotificationsPlugin _localNotifications =FlutterLocalNotificationsPlugin();  //step1

  Future<void> initFCM() async {
   
    await _messaging.requestPermission();
    String? token = await _messaging.getToken();
    print("FCM TOKEN: $token");

    // AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");
    AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@drawable/ic_launcher");
    InitializationSettings settings = InitializationSettings(android: androidInitializationSettings);
    FlutterLocalNotificationsPlugin().initialize(settings: settings);



    
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Got a message while in the foreground!");
      // print('Message:${message.notification?.title}');
      if (message.notification != null) {
        showNotification(message); // ✅ call here
      }
    
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message:${message.notification?.title}');
    });
  }

  Future<void> showNotification(RemoteMessage message) async {

    AndroidNotificationDetails androidNotificationDetails =AndroidNotificationDetails(
      'hight_importance_channel',
      'High Importance Channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =NotificationDetails(android: androidNotificationDetails);

   

    await _localNotifications.show(   // ✅ FIX (instance)
      id: 0,
      title: message.notification?.title ?? "No Title",
      body: message.notification?.body ?? "No Body",
      notificationDetails: notificationDetails,
    );


 
  }

  
}