import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seo_renderer/seo_renderer.dart';

import 'app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([seoRouteObserver]);

    return RobotDetector(
      child: MaterialApp.router(
        title: 'Toshi Ossada',
        routerConfig: Modular.routerConfig,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
        ),
      ),
    );
  }
}
