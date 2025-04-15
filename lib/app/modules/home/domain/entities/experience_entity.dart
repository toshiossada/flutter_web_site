import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

class ExperienceEntity {
  final String company;
  final DateTime start;
  final DateTime? end;
  final String role;
  final List<String> description;

  ExperienceEntity({
    required this.company,
    required this.start,
    this.end,
    required this.role,
    required this.description,
  });
  String get formattedStart => DateFormat('MM/yyyy').format(start);

  String get formattedEnd {
    if (end == null) {
      return "current".i18n();
    } else {
      return DateFormat('MM/yyyy').format(end!);
    }
  }
}
