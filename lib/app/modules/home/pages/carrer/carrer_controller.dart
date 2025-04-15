import 'dart:ui';

import '../../../../../app_store.dart';
import '../../domain/entities/experience_entity.dart';
import '../../domain/usecases/get_experiences_usecase.dart';
import 'carrer_store.dart';

class CarrerController {
  final GetExperiencesUsecase getExperiencesUsecase;
  final CarrerStore store;
  final AppStore appStore;

  CarrerController({
    required this.getExperiencesUsecase,
    required this.store,
    required this.appStore,
  });

  init() async {
    await getExperiences();
  }

  Future<List<ExperienceEntity>> getExperiences() async {
    try {
      store.loading = true;

      var experiences =
          await getExperiencesUsecase.call(appStore.locale == Locale('pt', 'BR'));
      store.experience = experiences;

      return experiences;
    } catch (e) {
      return [];
    } finally {
      store.loading = false;
    }
  }
}
