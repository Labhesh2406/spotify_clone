import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderAction extends StatelessWidget {
  const HeaderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 80,
        ),
        Icon(
          Icons.history,
          color: Colors.white,
          size: 35,
        ),
        SizedBox(
          width: 25,
        ),
        Icon(
          FontAwesomeIcons.gear,
          color: Colors.white,
          size: 30,
        )
      ],
    );
  }
}
