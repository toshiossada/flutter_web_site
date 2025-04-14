import 'package:intl/intl.dart'; // Import the intl package for date formatting

class ExperienceModel {
  final String company;
  final DateTime start;
  final DateTime? end; 
  final String role;
  final List<String> description;

  ExperienceModel({
    required this.company,
    required this.start,
    this.end, 
    required this.role,
    required this.description,
  });


  static DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return null;
    }
    return DateFormat('MM/yyyy').parseStrict(dateString);
  }

  static String? _formatDate(DateTime? date) {
    if (date == null) {
      return null;
    }
    return DateFormat('MM/yyyy').format(date);
  }

  /// Creates an ExperienceModel instance from a JSON map.
  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    List<String> descriptionList = [];
    if (json['description'] is List) {
      descriptionList =
          List<String>.from(json['description'].map((item) => item.toString()));
    }
    DateTime? startDate = _parseDate(json['start'] as String?);
    DateTime? endDate =
        _parseDate(json['end'] as String?); // end can be null in JSON

    // Validate required fields
    if (json['company'] == null || startDate == null || json['role'] == null) {
      throw FormatException(
          "Missing required fields (company, start, role) in Experience JSON: $json");
    }

    return ExperienceModel(
      company: json['company'] as String,
      start: startDate,
      end: endDate,
      role: json['role'] as String,
      description: descriptionList,
    );
  }

  /// Converts an ExperienceModel instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'start': _formatDate(start), 
      'end': _formatDate(end), 
      'role': role,
      'description': description,
    };
  }
}
