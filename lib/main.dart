import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

import 'app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RobotDetector(
      child: MaterialApp(
        title: 'Toshi Ossada\'s WebPages',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
        ),
        navigatorObservers: [seoRouteObserver],
        home: const HomePage(),
      ),
    );
  }
}
