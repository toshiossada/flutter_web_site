import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:seo_renderer/seo_renderer.dart';

import 'initial_page_controller.dart';

class InitialPage extends StatefulWidget {
  final InitialPageController controller;
  const InitialPage({super.key, required this.controller});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  InitialPageController get controller => widget.controller;

  var selectedIndex = 0;

  static const double _breakpoint = 700.0;

  @override
  void initState() {
    super.initState();

    final currentRoute = Modular.to.path;
    bool routeMatched = false;
    for (var page in PagesEnum.values) {
      if (currentRoute.startsWith(page.route)) {
        selectedIndex = page.pageIndex;
        routeMatched = true;
        break;
      }
    }
    if (!routeMatched) {
      selectedIndex = PagesEnum.about.pageIndex;

      Modular.to.pushReplacementNamed(PagesEnum.about.route);
    }
  }

  List<Widget> _buildNavigationItems(BuildContext context, bool isDrawer) {
    return List.generate(PagesEnum.values.length, (index) {
      final page = PagesEnum.values[index];
      final isSelected = page.pageIndex == selectedIndex;

      if (isDrawer) {
        return ListTile(
          title: Text(
            page.description.i18n(),
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: isSelected,
          onTap: () {
            Modular.to.navigate(page.route);
            Navigator.pop(context);
            setState(() {
              selectedIndex = page.pageIndex;
            });
          },
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
            onTap: () {
              Modular.to.navigate(page.route);
              setState(() {
                selectedIndex = page.pageIndex;
              });
            },
            child: Center(
              child: Text(
                page.description.i18n(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  decoration: isSelected
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationThickness: 2.0,
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  Widget _buildLanguageMenu() {
    return PopupMenuButton<Locale>(
      tooltip: "change_language".i18n(),
      onSelected: (Locale newLocale) {
        controller.appStore.locale = newLocale;
        setState(() {});
      },
      child: Row(
        children: [
          Text(
            controller.appStore.supportedLocales[controller.appStore.locale] ??
                '',
          ),
          SizedBox.square(
            dimension: 10,
          ),
          Icon(
            Icons.language,
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          ),
        ],
      ),
      itemBuilder: (BuildContext context) {
        return controller.appStore.supportedLocales.entries.map((entry) {
          final locale = entry.key;
          final name = entry.value;

          final bool isSelected = controller.appStore.locale == locale ||
              (controller.appStore.locale == null &&
                  WidgetsBinding.instance.platformDispatcher.locale == locale);

          return PopupMenuItem<Locale>(
            value: locale,
            child: Text(
              name,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < _breakpoint;

    return Scaffold(
      drawer: isSmallScreen
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Row(
                      children: [
                        ImageRenderer(
                          alt: 'Toshi Ossada Logo',
                          child: Image.asset(
                            'assets/images/favicon.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Toshi Ossada',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  _buildLanguageMenu(),
                  ..._buildNavigationItems(context, true),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Modular.to.navigate(PagesEnum.about.route);
            setState(() {
              selectedIndex = PagesEnum.about.pageIndex;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageRenderer(
                alt: 'Toshi Ossada Logo',
                child: Image.asset(
                  'assets/images/favicon.png',
                  height: 40,
                ),
              ),
              const SizedBox(width: 15),
              const Text('Toshi Ossada'),
            ],
          ),
        ),
        actions: isSmallScreen
            ? null
            : [
                _buildLanguageMenu(),
                ..._buildNavigationItems(context, false),
                const SizedBox(width: 16),
              ],
      ),
      body: const RouterOutlet(),
    );
  }
}

enum PagesEnum {
  about(
    pageIndex: 0,
    route: '/about',
    description: 'about',
  ),
  carrer(
    pageIndex: 1,
    route: '/carrer',
    description: 'carrer',
  ),
  contact(
    pageIndex: 2,
    route: '/contact',
    description: 'contact',
  );

  const PagesEnum({
    required this.pageIndex,
    required this.route,
    required this.description,
  });

  final int pageIndex;
  final String route;
  final String description;
}
