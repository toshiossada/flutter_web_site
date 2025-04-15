import 'package:flutter_modular/flutter_modular.dart';
import 'package:homepage/app_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<AppStore>(AppStore.new);
  }
}
