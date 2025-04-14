import 'package:flutter_modular/flutter_modular.dart';
import 'package:homepage/app/modules/home/data/repositories/datasources/experience_datasource.dart';
import 'package:homepage/app/modules/home/pages/initial/initial_page.dart';

import 'data/datasource/experience_datasource_impl.dart';
import 'data/mappers/experience_mapper.dart';
import 'data/repositories/experience_repository_impl.dart';
import 'domain/interfaces/experience_repository.dart';
import 'domain/usecases/get_experiences_usecase.dart';
import 'pages/about/about_page.dart';
import 'pages/carrer/carrer_controller.dart';
import 'pages/carrer/carrer_page.dart';
import 'pages/carrer/carrer_store.dart';
import 'pages/contacts/contact_page.dart';
import 'pages/generator/experiences_pages.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add(CarrerStore.new)
      ..add(CarrerController.new)
      ..add(GetExperiencesUsecase.new)
      ..add<ExperienceRepository>(ExperienceRepositoryImpl.new)
      ..add<ExperienceMapper>(ExperienceMapper.new)
      ..add<ExperienceDatasource>(ExperienceDatasourceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child('/', child: (_) => InitialPage(), children: [
        ChildRoute('/about', child: (_) => AboutPage()),
        ChildRoute('/contact', child: (_) => ContactPage()),
        ChildRoute('/carrer',
            child: (_) => CarrerPage(
                  controller: Modular.get<CarrerController>(),
                )),
      ])
      ..child('/experiences-generator', child: (_) => ExperiencesPage());
  }
}
