import 'package:flutter/material.dart';
import 'package:spotify_clone/BottomNavigation.dart';
import 'package:spotify_clone/Search/widgets/searchwidget.dart';
import 'package:spotify_clone/Search/widgets/topgenre.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(18, 18, 18, 80),
        body: Container(
            child: ListView(
          children: const [
            Text(
              "Search",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.bold,
              ),
            ),
            SearchWidget(),
            TopGenre(),
          ],
        )),
        bottomNavigationBar: BottomBar(1),
      ),
    );
  }
}
