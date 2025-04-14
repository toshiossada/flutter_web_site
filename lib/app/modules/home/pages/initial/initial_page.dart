import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seo_renderer/seo_renderer.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var selectecIndex = 0;
  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/about');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              Modular.to.navigate('/about');
              selectecIndex = 0;
              setState(() {});
            },
            child: Row(
              children: [
                ImageRenderer(
                  alt: 'Toshi Ossada Logo',
                  child: Image.asset(
                    'assets/images/favicon.png',
                    height: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Toshi Ossada')
              ],
            ),
          ),
          actions: [
            ...List.generate(PagesEnum.values.length, (index) {
              final page = PagesEnum.values[index];
              final isSelected = page.pageIndex == selectecIndex;

              return Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: InkWell(
                  child: Text(
                    page.description,
                    style: TextStyle(
                      fontSize: 24,
                      decoration: isSelected
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
                  ),
                  onTap: () {
                    Modular.to.navigate(page.route);
                    selectecIndex = page.pageIndex;
                    setState(() {});
                  },
                ),
              );
            }),
            Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: SizedBox.square()),
          ],
        ),
        body: RouterOutlet());
  }
}

enum PagesEnum {
  about(
    pageIndex: 0,
    route: '/about',
    description: 'Sobre',
  ),
  carrer(
    pageIndex: 1,
    route: '/carrer',
    description: 'Carreira',
  ),
  contact(
    pageIndex: 2,
    route: '/contact',
    description: 'Contato',
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
