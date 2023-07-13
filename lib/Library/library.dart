import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify_clone/BottomNavigation.dart';
import 'package:spotify_clone/Library/library.widget/tiles.dart';

import '../Data.dart';
import 'library.widget/Header.dart';
import 'library.widget/RoundedCards.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: ListView(
        children: [
          const Header(),
          const Row(
            children: [
              SizedBox(width: 10),
              RoundedCards(text: 'Platlist'),
              SizedBox(width: 10),
              RoundedCards(text: 'Artist'),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.compare_arrows_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Recently Played',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Librefranklin',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
          ...Data().library.map((val) {
            return GFListTile(
              color: Colors.transparent,
              avatar: GFAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(val['image'].toString()),
                radius: 30,
                shape: val['shape'] as dynamic,
              ),
              title: Text(
                val['name'].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              subTitle: Text(
                val['subtitle'].toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(167, 167, 167, 1),
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
          Tiles(
            title: 'Add Artist',
            shape: GFAvatarShape.circle,
          ),
          Tiles(
            title: 'Add Podcast and show',
            shape: GFAvatarShape.square,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(2),
    );
  }
}
