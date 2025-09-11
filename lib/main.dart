import 'package:flutter/material.dart';
import 'package:movies/views/home.dart';
import 'package:movies/views/details.dart';
import 'package:movies/widget/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        "/home": (context) => Home(),
        "/details": (context) => Details(),
      },
    );
  }
}
