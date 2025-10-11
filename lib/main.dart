import 'package:cook_book/pages/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Book',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(86, 213, 204, 230),
        body: const Home(),
      ),
    );
  }
}
