import 'package:flutter/cupertino.dart';
import 'package:homepage/app/modules/home/domain/entities/experience_entity.dart';

class CarrerStore extends ChangeNotifier {
  List<ExperienceEntity> _experience = [];
  List<ExperienceEntity> get experience => _experience;
  set experience(List<ExperienceEntity> value) {
    _experience = value;
    notifyListeners();
  }

  bool _loading = true;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  CarrerStore();
}
