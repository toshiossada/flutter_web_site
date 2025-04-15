import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
