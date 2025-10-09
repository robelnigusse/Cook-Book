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
      // theme: ThemeData(
      //   primarySwatch: Colors.deepOrange,
      //   scaffoldBackgroundColor: Colors.grey[50],
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     foregroundColor: Colors.grey[900],
      //     titleTextStyle: TextStyle(
      //       color: Colors.grey[900],
      //       fontSize: 20,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   cardTheme: CardTheme(
      //     elevation: 2,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(16),
      //     ),
      //   ),
      // ),
      home: const MyHomePage(title: 'Cook Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}
