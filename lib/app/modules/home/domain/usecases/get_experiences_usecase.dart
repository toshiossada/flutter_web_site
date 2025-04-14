import '../entities/experience_entity.dart';
import '../interfaces/experience_repository.dart';


class GetExperiencesUsecase {
  final ExperienceRepository repository;

  GetExperiencesUsecase({required this.repository});

  Future<List<ExperienceEntity>> call() async {
    return await repository.getExperiences();
  }
}
