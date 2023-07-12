import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// ignore: must_be_immutable
class Tiles extends StatelessWidget {
  Tiles({super.key, required this.title, required this.shape});
  String title;
  GFAvatarShape shape;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      avatar: GFAvatar(
        radius: 30,
        backgroundColor: Colors.grey[900],
        shape: shape,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white54,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
