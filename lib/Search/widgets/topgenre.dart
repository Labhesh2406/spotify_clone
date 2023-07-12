import 'package:flutter/material.dart';
import 'package:spotify_clone/Search/widgets/tiles.dart';

import '../../Data.dart';

class TopGenre extends StatelessWidget {
  const TopGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Your top genre",
          style: TextStyle(
            fontFamily: 'LibreFranklin',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Tiles(something: Data().genres),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Browse All",
          style: TextStyle(
            fontFamily: 'LibreFranklin',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Tiles(something: Data().browseall)
      ],
    );
  }
}
