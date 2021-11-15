import 'package:flutter/material.dart';

import 'app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toshi Ossada\'s WebPages',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      home: const HomePage(),
    );
  }
}
