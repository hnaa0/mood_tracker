import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/settings/models/theme_config_model.dart';
import 'package:mood_tracker/features/settings/repos/theme_config_repository.dart';

class ThemeConfigViewModel extends Notifier<ThemeConfigModel> {
  final ThemeConfigRepository _repository;

  ThemeConfigViewModel(this._repository);

  @override
  ThemeConfigModel build() {
    return ThemeConfigModel(darkMode: _repository.isDarkMode());
  }

  void setDarkMode(bool value) {
    state = ThemeConfigModel(darkMode: value);
    _repository.setDarkMode(value);
  }
}

final themeConfigProvider =
    NotifierProvider<ThemeConfigViewModel, ThemeConfigModel>(
  () => throw UnimplementedError(),
);
