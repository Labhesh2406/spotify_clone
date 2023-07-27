import "package:awesome_notifications/awesome_notifications.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:spotify_clone/Utils/notify.dart";
import 'package:get/get.dart';

import "Home/HomePage.dart";
import "Library/library.dart";
import "Premium/premium.dart";
import "Search/search.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic',
      channelName: 'basic notification',
      channelDescription: 'notification for playing/pausing audio',
      importance: NotificationImportance.High,
      enableVibration: false,
      channelShowBadge: true,
    ),
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Notify notify = Get.put(Notify());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => Search(),
        '/library': (context) => Library(),
        '/premium': (context) => Premium()
      },
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("ok"),
//     );
//   }
// }
