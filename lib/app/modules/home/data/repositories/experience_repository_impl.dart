import '../../domain/entities/experience_entity.dart';
import '../../domain/interfaces/experience_repository.dart';
import '../mappers/experience_mapper.dart';
import 'datasources/experience_datasource.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  final ExperienceDatasource datasource;
  final ExperienceMapper mapper;

  ExperienceRepositoryImpl({required this.datasource, required this.mapper});

  @override
  Future<List<ExperienceEntity>> getExperiences(bool isPtBr) async {
    final experiences = await datasource.getExperiences(isPtBr);

    return experiences.map(mapper.toEntity).toList();
  }
}
