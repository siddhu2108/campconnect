// ignore_for_file: must_be_immutable, camel_case_types

import 'dart:io';
import 'package:campus1/login/desk.dart';
import 'package:campus1/login/mobile.dart';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
      home: DesktopLoginPage(),
    );
  }
}


Widget getStartPage() {
  if (Platform.isAndroid || Platform.isIOS) {
    return mobileLogin();
  } else {
    // Fallback for other platforms
    return mobileLogin();
  }
}
