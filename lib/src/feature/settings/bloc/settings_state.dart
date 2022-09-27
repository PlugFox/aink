part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();

  /// Idling state
  const factory SettingsState.idle({
    required final SettingsEntity data,
    @Default('Idle') final String message,
  }) = _IdleSettingsState;

  /// Processing
  const factory SettingsState.processing({
    required final SettingsEntity data,
    @Default('Processing') final String message,
  }) = _ProcessingSettingsState;

  /// Successful
  const factory SettingsState.successful({
    required final SettingsEntity data,
    @Default('Successful') final String message,
  }) = _SuccessfulSettingsState;

  /// An error has occurred
  const factory SettingsState.error({
    required final SettingsEntity data,
    @Default('An error has occurred') final String message,
  }) = _ErrorSettingsState;

  /// If an error has occurred
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in progress state
  bool get isProcessing => maybeMap<bool>(orElse: () => false, processing: (_) => true);
}
