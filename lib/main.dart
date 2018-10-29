import 'package:flutter/material.dart';
import 'package:fodya_app/pages/dashboard.dart';
import 'package:fodya_app/pages/homepage.dart';
import 'package:fodya_app/theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fodya Application',
      theme: getAppTheme(),
      home: Homepage(),
    );
  }
}


