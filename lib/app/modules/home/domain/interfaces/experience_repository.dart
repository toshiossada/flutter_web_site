import '../entities/experience_entity.dart'; // Adjust path if needed

abstract class ExperienceRepository {
  Future<List<ExperienceEntity>> getExperiences();
}
