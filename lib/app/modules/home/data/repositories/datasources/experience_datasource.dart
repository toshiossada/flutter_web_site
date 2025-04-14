import '../models/experience_model.dart';

abstract interface class ExperienceDatasource {
  Future<List<ExperienceModel>> getExperiences();
}
