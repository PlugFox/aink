import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../common/util/error_util.dart';
import '../../../common/util/timeouts.dart';
import '../data/settings_repository.dart';
import '../model/settings_entity.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBLoC extends StreamBloc<SettingsEvent, SettingsState> {
  SettingsBLoC({required ISettingsRepository repository})
      : _repository = repository,
        super(_getInitialState(repository));

  static SettingsState _getInitialState(ISettingsRepository repository) {
    SettingsEntity settings;
    try {
      settings = repository.getSettings();
    } on Object catch (error, stackTrace) {
      ErrorUtil.logError(error, stackTrace);
      settings = SettingsEntity();
    }
    return SettingsState.idle(data: settings);
  }

  final ISettingsRepository _repository;

  @override
  Stream<SettingsState> mapEventToStates(SettingsEvent event) => event.map<Stream<SettingsState>>(mutate: _mutate);

  Stream<SettingsState> _mutate(_MutateSettingsEvent event) async* {
    try {
      yield SettingsState.processing(data: state.data);
      await _repository.saveSettings(event.settings).logicTimeout();
      yield SettingsState.successful(data: event.settings);
    } on Object {
      yield SettingsState.error(data: state.data);
      rethrow;
    } finally {
      yield SettingsState.idle(data: state.data);
    }
  }
}
