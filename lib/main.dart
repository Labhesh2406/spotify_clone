import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "Home/HomePage.dart";
import "Library/library.dart";
import "Premium/premium.dart";
import "Search/search.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const HomePage(),
      '/search': (context) => const Search(),
      '/library': (context) => const Library(),
      '/premium': (context) => const Premium()
    }),
  );
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
