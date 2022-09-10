part of 'promt_bloc.dart';

/* Promt Events */

@freezed
class PromtEvent with _$PromtEvent {
  const PromtEvent._();

  /// Generate a new promt
  const factory PromtEvent.generate({required String promt}) = GeneratePromtEvent;
}
