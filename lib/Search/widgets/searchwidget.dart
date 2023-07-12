import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: const Row(
        children: [
          SizedBox(width: 10),
          Icon(
            Icons.search_sharp,
            size: 30,
            color: Color.fromRGBO(83, 83, 83, 1),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Artists, Songs or Podcast',
            style: TextStyle(
              fontFamily: 'LibreFranklin',
              color: Color.fromRGBO(83, 83, 83, 1),
              fontSize: 17,
            ),
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.fade,
          )
        ],
      ),
    );
  }
}
