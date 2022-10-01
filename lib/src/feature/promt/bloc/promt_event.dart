part of 'promt_bloc.dart';

/* Promt Events */

@freezed
class PromtEvent with _$PromtEvent {
  const PromtEvent._();

  /// Restore promt from database and fetch result
  const factory PromtEvent.restore() = _RestorePromtEvent;

  /// Generate a new promt
  const factory PromtEvent.generate({required String promt}) = _GeneratePromtEvent;

  /// Focus image as main image
  const factory PromtEvent.focus({required int index}) = _FocusPromtEvent;
}
