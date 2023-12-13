import 'package:flutter/material.dart';

import './screens/intro.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Articars',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          // hintColor: Colors.deepOrange,
          fontFamily: 'OpenSans',
        ),
        home: const Intro(),);
  }
}
