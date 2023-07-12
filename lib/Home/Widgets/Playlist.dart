import "package:flutter/material.dart";

import "../../Data.dart";
import "../../audio.dart";

class Playlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 5.5,
        ),
        children: Data().playlist.map(
          (val) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AudioPlayerPro(
                            audioURL: val['audio'].toString(),
                            image: val['image'].toString(),
                            name: val['name'].toString(),
                          )),
                );
              },
              child: Card(
                  color: Color.fromARGB(49, 58, 55, 1),
                  child: IntrinsicHeight(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(val['image'].toString()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          val['name'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ))),
            );
          },
        ).toList());
  }
}
