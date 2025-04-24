import 'package:flutter_modular/flutter_modular.dart';

import 'pages/dne_page.dart';

class DNEModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => DNEPage(
        name: r.args.queryParams['name'] ?? '',
        school: r.args.queryParams['school'] ?? '',
        course: r.args.queryParams['course'] ?? '',
        document: r.args.queryParams['document'] ?? '',
        photo: r.args.queryParams['photo'] ?? '',
      ),
    );
  }
}

// '/dne/?name=Kevlin Toshinari Ossada&school=Faculdade de Tecnologia de Americana&course=Analise e Desenvolvimento de S&document=496271167&photo=https://avatars.githubusercontent.com/u/2637049'
