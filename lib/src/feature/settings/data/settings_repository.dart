import '../model/settings_entity.dart';
import 'settings_database_provider.dart';

abstract class ISettingsRepository {
  SettingsEntity getSettings();
  Future<void> saveSettings(SettingsEntity settings);
}

class SettingsRepositoryImpl implements ISettingsRepository {
  SettingsRepositoryImpl({required ISettingsDatabaseProvider databaseProvider}) : _databaseProvider = databaseProvider;

  final ISettingsDatabaseProvider _databaseProvider;

  @override
  SettingsEntity getSettings() => _databaseProvider.getSettings();

  @override
  Future<void> saveSettings(SettingsEntity settings) => _databaseProvider.saveSettings(settings);
}
