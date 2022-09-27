import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/promt/bloc/promt_bloc.dart';
import '../../feature/promt/data/promt_database_provider.dart';
import '../../feature/promt/data/promt_network_provider.dart';
import '../../feature/promt/data/promt_repository.dart';
import '../../feature/settings/bloc/settings_bloc.dart';
import '../../feature/settings/data/settings_database_provider.dart';
import '../../feature/settings/data/settings_repository.dart';
import '../constant/environment.dart';
import '../data/rest_client.dart';

@sealed
abstract class Dependencies {
  Dependencies._();

  static Dependencies get instance => _instance ?? (throw UnsupportedError('Dependencies not initialized'));
  static Dependencies? _instance;

  static Future<Dependencies> initialize() async {
    final sp = SharedPreferences.getInstance();
    return _instance = _DependenciesProduction(
      sharedPreferences: await sp,
    );
  }

  abstract final PromtBLoC promtBLoC;

  abstract final SettingsBLoC settingsBLoC;
}

class _DependenciesProduction implements Dependencies {
  _DependenciesProduction({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  late final RestClient _httpClient = RestClient(uri: kEndpoint);

  // --- Promt --- //

  late final IPromtDatabaseProvider _promtDatabaseProvider =
      PromtDatabaseProviderImpl(sharedPreferences: _sharedPreferences);

  late final IPromtNetworkDataProvider _promtNetworkDataProvider = PromtNetworkDataProviderImpl(client: _httpClient);

  late final IPromtRepository _promtRepository =
      PromtRepositoryImpl(databaseProvider: _promtDatabaseProvider, networkDataProvider: _promtNetworkDataProvider);

  @override
  late final PromtBLoC promtBLoC = PromtBLoC(repository: _promtRepository)..add(const PromtEvent.restore());

  // --- Settings --- //

  late final ISettingsDatabaseProvider _settingsDatabaseProvider =
      SettingsDatabaseProviderImpl(sharedPreferences: _sharedPreferences);

  late final ISettingsRepository _settingsRepository =
      SettingsRepositoryImpl(databaseProvider: _settingsDatabaseProvider);

  @override
  late final SettingsBLoC settingsBLoC = SettingsBLoC(repository: _settingsRepository);
}
