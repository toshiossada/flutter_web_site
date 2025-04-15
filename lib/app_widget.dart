import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:seo_renderer/seo_renderer.dart';

import 'app_store.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  AppStore get controller => Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([seoRouteObserver]);
    LocalJsonLocalization.delegate.directories = ['assets/lang'];
    return RobotDetector(
      child: ValueListenableBuilder(
          valueListenable: controller.localeNotifier,
          builder: (_, value, __) {
            return MaterialApp.router(
              title: 'Toshi Ossada',
              key: Key(value == null
                  ? 'locale'
                  : controller.supportedLocales[value]!.toString()),
              locale: value,
              localeResolutionCallback: (locale, supportedLocales) {
                Locale? finalLocale = Locale('en', 'US');

                if (supportedLocales.contains(locale)) {
                  finalLocale = locale;
                }

                if (locale?.languageCode == 'pt') {
                  finalLocale == Locale('pt', 'BR');
                }
                if (controller.locale != finalLocale) {
                  controller.locale = finalLocale;
                }
                return finalLocale;
              },
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                LocalJsonLocalization.delegate,
              ],
              supportedLocales: controller.supportedLocales.keys,
              routerConfig: Modular.routerConfig,
              theme: ThemeData(
                colorScheme: const ColorScheme.dark(),
              ),
            );
          }),
    );
  }
}
