import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/home/home_module.dart';
import 'app/modules/home/pages/dne/dne_module.dart';
import 'core_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void routes(RouteManager r) {
    r
      ..module('/', module: HomeModule())
      ..module('/dne', module: DNEModule());
  }
}
