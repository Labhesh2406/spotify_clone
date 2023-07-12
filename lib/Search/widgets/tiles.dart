import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  const Tiles({super.key, required this.something});
  final List<String> something;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 16 / 9,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: something.map((imageURL) {
            return Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(imageURL, fit: BoxFit.cover)),
            );
          }).toList()),
    );
  }
}
