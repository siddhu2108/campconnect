// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double textsize;
  final FontWeight fw;

  MyText({
    Key? key,
    required this.text,
    required this.fw,
    required this.textsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textsize, // Set your desired default font size
        color: Colors.black,
        fontWeight: fw,
      ),
    );
  }
}
