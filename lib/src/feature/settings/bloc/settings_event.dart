part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.mutate(SettingsEntity settings) = _MutateSettingsEvent;
}
