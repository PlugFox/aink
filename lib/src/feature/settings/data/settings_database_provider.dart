import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/settings_entity.dart';

abstract class ISettingsDatabaseProvider {
  SettingsEntity getSettings();
  Future<void> saveSettings(SettingsEntity settings);
}

class SettingsDatabaseProviderImpl implements ISettingsDatabaseProvider {
  SettingsDatabaseProviderImpl({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  static const String _settingsKey = 'settings';
  final SharedPreferences _sharedPreferences;

  @override
  SettingsEntity getSettings() =>
      SettingsEntity.fromJson(jsonDecode(_sharedPreferences.getString(_settingsKey) ?? '{}') as Map<String, Object?>);

  @override
  Future<void> saveSettings(SettingsEntity settings) =>
      _sharedPreferences.setString(_settingsKey, jsonEncode(settings.toJson()));
}
