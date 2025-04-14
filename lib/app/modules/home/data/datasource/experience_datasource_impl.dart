import 'dart:convert'; // For jsonDecode

import 'package:flutter/services.dart' show rootBundle; 


import '../repositories/datasources/experience_datasource.dart';
import '../repositories/models/experience_model.dart';

class ExperienceDatasourceImpl implements ExperienceDatasource {
  final String _assetPath = 'assets/experiences.json';

  @override
  Future<List<ExperienceModel>> getExperiences() async {
    final jsonString = await rootBundle.loadString(_assetPath);

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
      }).toList(); // Convert the iterable map result into a List

      return experiences;
    } else {
      throw FormatException(
          "Invalid JSON structure: 'experiences' key not found or is not a list in $_assetPath");
    }
  }
}

