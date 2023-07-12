import 'package:flutter/material.dart';
import 'package:spotify_clone/BottomNavigation.dart';

import 'Widgets/HeaderAction.dart';
import 'Widgets/JumpIn.dart';
import 'Widgets/Playlist.dart';
import 'Widgets/RecentlyPlayed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 90, 81, 1),
              Color.fromRGBO(46, 71, 65, 1),
              Color.fromRGBO(56, 64, 59, 1),
              Color.fromRGBO(18, 18, 18, 1),
            ], stops: [
              0.01,
              0.03,
              0.06,
              0.2,
            ]),
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Good Evening",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LibreFranklin',
                      ),
                    ),
                  ),
                  HeaderAction(),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 210,
                child: Playlist(),
              ),
              const SizedBox(height: 20),
              RecentlyPlayed(),
              JumpIn(),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(0),
      ),
    );
  }
}
