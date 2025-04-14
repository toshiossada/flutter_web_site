import '../../domain/entities/experience_entity.dart';
import '../repositories/models/experience_model.dart';

class ExperienceMapper {
  ExperienceEntity toEntity(ExperienceModel model) {
    return ExperienceEntity(
      company: model.company,
      start: model.start,
      end: model.end,
      role: model.role,
      description: model.description,
    );
  }

  ExperienceModel toModel(ExperienceEntity entity) {
    return ExperienceModel(
      company: entity.company,
      start: entity.start,
      end: entity.end,
      role: entity.role,
      description: entity.description,
    );
  }
}
