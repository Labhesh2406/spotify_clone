import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AudioPlayerPro extends StatefulWidget {
  const AudioPlayerPro(
      {super.key,
      required this.audioURL,
      required this.image,
      required this.name});

  final String audioURL;
  final String image;
  final String name;

  @override
  State<AudioPlayerPro> createState() => _AudioPlayerProState();
}

class _AudioPlayerProState extends State<AudioPlayerPro> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              LineIcons.angleDown,
            ),
          ]),
        ],
      ),
    );
  }
}
