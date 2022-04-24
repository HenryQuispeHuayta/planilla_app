import 'package:flutter/material.dart';
import 'package:plantilla_app/src/Home_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de planillas',
      home: homePage()
    );
  }
}