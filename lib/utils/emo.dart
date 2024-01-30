import "package:flutter/material.dart";

class emo extends StatelessWidget {
  final String emoface;

  const emo({super.key, required this.emoface});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.blue[500], borderRadius: BorderRadius.circular(6)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(emoface, style: TextStyle(color: Colors.white)),
              ],
            )
          ],
        ));
  }
}
