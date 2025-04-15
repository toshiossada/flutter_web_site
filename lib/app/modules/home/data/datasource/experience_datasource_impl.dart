import 'dart:convert';

import 'package:dio/dio.dart';

import '../repositories/datasources/experience_datasource.dart';
import '../repositories/models/experience_model.dart';

class ExperienceDatasourceImpl implements ExperienceDatasource {
  final String _assetPath =
      'https://raw.githubusercontent.com/toshiossada/toshiossada/refs/heads/main/experiences.json';
  final String _assetPathEnUs =
      'https://raw.githubusercontent.com/toshiossada/toshiossada/refs/heads/main/experiences_enUs.json';

  @override
  Future<List<ExperienceModel>> getExperiences(bool isPtBr) async {
    final urlString = isPtBr ? _assetPath : _assetPathEnUs;
    final http = Dio();
    try {
      final response = await http.get(urlString);

      if (response.statusCode == 200) {
        final jsonString = response.data;
        final decodedJson = jsonDecode(jsonString) as Map<String, dynamic>;

        if (decodedJson.containsKey('experiences') &&
            decodedJson['experiences'] is List) {
          final List<dynamic> experienceListJson =
              decodedJson['experiences'] as List<dynamic>;

          final List<ExperienceModel> experiences =
              experienceListJson.map((jsonItem) {
            if (jsonItem is Map<String, dynamic>) {
              return ExperienceModel.fromJson(jsonItem);
            } else {
              throw FormatException(
                  "Invalid item type found in 'experiences' list: ${jsonItem.runtimeType}");
            }
          }).toList();

          return experiences;
        } else {
          throw FormatException(
              "Invalid JSON structure: 'experiences' key not found or is not a list in $urlString");
        }
      } else {
        throw Exception(
            'Failed to load experiences from $urlString. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching experiences from $urlString: $e');
    }
  }
}
